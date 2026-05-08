; DESCRIPTION: This GeOS assembly code implements a window manager that controls three windows on the screen. It supports dragging windows by clicking and holding the title bar, closing windows by clicking the close button in the top-right corner of the title bar, and re-tiling the remaining windows after one is closed. The system uses various registers to track window states, handle mouse and keyboard inputs, and manage drawing operations.

; wm_drag_close.asm -- Window Manager with drag, close, and re-tiling (Phase 95)
;
; A window manager process that owns the full screen, tracks rectangular regions
; for each window, handles mouse drag on title bars, supports close buttons,
; and re-tiles remaining windows after close.
;
; Uses WINSYS (create/destroy/hittest/moveto/winfo), MOUSEQ, and WPIXEL.
;
; Controls:
;   Mouse move + click title bar = drag window
;   Click close button (red X, top-right of title bar) = close window
;   Press Q to quit
;
; ── Register Layout ──────────────────────────────────────────────
;   r3  = constant 1
;   r20 = constant 0
;   r0-r14 = window IDs (0 if closed)
;   r1 = dragging window id (0 = none)
;   r16 = drag offset X
;   r17 = drag offset Y
;   r18 = animation counter
;   r21-r23 = mouse mx, my, btn (from MOUSEQ)
;   r24 = keyboard key (from IKEY)
;   r25-r29 = scratch
; ──────────────────────────────────────────────────────────────────

; ── Constants ──
LDI r3, 1
LDI r20, 0
LDI r30, 0xFF00

; ── Store title strings in RAM ──
LDI r12, 0x2000
STRO r12, "Draw"
LDI r12, 0x2020
STRO r12, "Status"
LDI r12, 0x2040
STRO r12, "Colors"

; ── Create 3 windows ──

; Window 1 "Draw" at (16, 16), 100x80
LDI r2, 16
LDI r10, 16
LDI r15, 100
LDI r9, 80
LDI r13, 0x2000
LDI r12, 0
WINSYS r12
MOV r0, r11

; Window 2 "Status" at (136, 16), 100x80
LDI r2, 136
LDI r10, 16
LDI r15, 100
LDI r9, 80
LDI r13, 0x2020
LDI r12, 0
WINSYS r12
MOV r7, r11

; Window 3 "Colors" at (76, 110), 100x80
LDI r2, 76
LDI r10, 110
LDI r15, 100
LDI r9, 80
LDI r13, 0x2040
LDI r12, 0
WINSYS r12
MOV r14, r11

; ── Draw initial window contents ──
CALL draw_win1_content
CALL draw_win2_content
CALL draw_win3_content

; ── Drag state ──
LDI r1, 0
LDI r16, 0
LDI r17, 0
LDI r18, 0

; ══════════════════════════════════════════════════════════════════
; ── Main Loop ──
; ══════════════════════════════════════════════════════════════════
main_loop:
  FILL r20          ; clear screen to black

  ; Read mouse state
  MOUSEQ r21        ; r21=mx, r22=my, r23=btn

  ; Read keyboard
  IKEY r24
  LDI r25, 81       ; 'Q'
  CMP r24, r25
  JZ r11, quit

  ; ── Handle mouse click ──
  LDI r25, 2
  CMP r23, r25      ; btn == 2 (click)?
  BGE r11, check_drag

  ; Fresh click -- do hittest
  LDI r12, 4         ; op=4 (hittest)
  WINSYS r12         ; r11=win_id, r2=hit_type

  ; If no hit, skip
  JZ r11, no_click_action

  ; Bring clicked window to front
  LDI r12, 2         ; op=2 (bring to front)
  WINSYS r12

  ; Save hit window id for later
  MOV r28, r11       ; r28 = hit_win_id

  ; ── Get window info for close button check ──
  LDI r2, 0x9000    ; winfo dest addr
  LDI r12, 6         ; op=6 (winfo)
  WINSYS r12

  ; Read window x, y, w from winfo output
  LDI r25, 0x9000
  LOAD r25, r25     ; r25 = win_x
  LDI r26, 0x9001
  LOAD r26, r26     ; r26 = win_y
  LDI r27, 0x9002
  LOAD r27, r27     ; r27 = win_w

  ; close_x = win_x + win_w - 12
  MOV r29, r25
  ADD r29, r27
  LDI r12, 12
  SUB r29, r12       ; r29 = close_x

  ; Check if mouse is in close button area:
  ;   mx >= close_x AND mx < close_x + 10 AND my >= win_y AND my < win_y + 12

  ; Check mx >= close_x
  CMP r21, r29
  BLT r11, start_drag_check    ; mx < close_x, not on close button

  ; Check mx < close_x + 10
  MOV r12, r29
  LDI r25, 10
  ADD r12, r25       ; r12 = close_x + 10
  CMP r21, r12
  BGE r11, start_drag_check    ; mx >= close_x + 10, not on close button

  ; Check my >= win_y AND my < win_y + 12
  ; (r26 = win_y, already loaded)
  CMP r22, r26
  BLT r11, start_drag_check    ; my < win_y
  LDI r25, 12
  ADD r25, r26       ; win_y + 12
  CMP r22, r25
  BGE r11, start_drag_check    ; my >= win_y + 12

  ; ── Close button clicked! Destroy the window ──
  MOV r11, r28       ; restore hit window id
  LDI r12, 1         ; op=1 (destroy)
  WINSYS r12

  ; Clear the window id from our tracking
  CMP r0, r28
  JZ r11, closed_w1
  CMP r7, r28
  JZ r11, closed_w2
  LDI r14, 0
  JMP do_retile

closed_w1:
  LDI r0, 0
  JMP do_retile

closed_w2:
  LDI r7, 0

do_retile:
  CALL retile_windows
  JMP no_click_action

  ; ── Start drag (title bar hit, not close button) ──
start_drag_check:
  ; Re-do hittest for hit_type (r2 was overwritten by winfo)
  LDI r12, 4
  WINSYS r12          ; r11=win_id, r2=hit_type

  ; Check hit type -- title bar (1) = start drag
  LDI r25, 1
  CMP r2, r25
  JNZ r11, no_click_action

  ; Start dragging
  MOV r1, r11

  ; Get window info for drag offset
  LDI r2, 0x9000
  LDI r12, 6
  WINSYS r12

  ; drag_ox = mouse_x - win_x
  LDI r25, 0x9000
  LOAD r25, r25      ; win_x
  MOV r26, r21
  SUB r26, r25
  MOV r16, r26

  ; drag_oy = mouse_y - win_y
  LDI r25, 0x9001
  LOAD r25, r25      ; win_y
  MOV r26, r22
  SUB r26, r25
  MOV r17, r26

  JMP no_click_action

check_drag:
  ; If not dragging, skip
  JZ r1, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r11, r1       ; win_id
  MOV r2, r21
  SUB r2, r16       ; new_x = mx - drag_ox
  MOV r10, r22
  SUB r10, r17       ; new_y = my - drag_oy
  LDI r12, 5         ; op=5 (moveto)
  WINSYS r12

  JMP no_click_action

stop_drag:
  LDI r1, 0
  JMP no_click_action

no_click_action:

  ; ── Update animation counter (throttled) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 7
  AND r26, r27
  JNZ r26, skip_update
  ADD r18, r3
  CALL draw_win2_content
  CALL draw_win3_content
skip_update:

  ; ── Draw all window frames ──
  JZ r0, skip_frame1
  MOV r11, r0
  CALL draw_window_frame
skip_frame1:

  JZ r7, skip_frame2
  MOV r11, r7
  CALL draw_window_frame
skip_frame2:

  JZ r14, skip_frame3
  MOV r11, r14
  CALL draw_window_frame
skip_frame3:

  FRAME
  JMP main_loop

quit:
  HALT

; ══════════════════════════════════════════════════════════════════
; ── Re-tile remaining windows ──
; ══════════════════════════════════════════════════════════════════
retile_windows:
  PUSH r31
  PUSH r11
  PUSH r2
  PUSH r10
  PUSH r15
  PUSH r9
  PUSH r13
  PUSH r12

  ; Count active windows
  LDI r15, 0
  JZ r0, ret_cnt2
  ADD r15, r3
ret_cnt2:
  JZ r7, ret_cnt3
  ADD r15, r3
ret_cnt3:
  JZ r14, ret_done_cnt
  ADD r15, r3
ret_done_cnt:

  ; If 0 windows, nothing to tile
  JZ r15, retile_done

  ; Compute tile width = 240 / count
  LDI r9, 240
  DIV r9, r15        ; r9 = tile_width
  LDI r25, 8
  MOV r13, r25       ; r13 = current_x (start at 8)

  ; Tile window 1
  JZ r0, retile_w2
  MOV r11, r0
  MOV r2, r13
  LDI r10, 16
  LDI r12, 5
  WINSYS r12
  ADD r13, r9
retile_w2:

  ; Tile window 2
  JZ r7, retile_w3
  MOV r11, r7
  MOV r2, r13
  LDI r10, 16
  LDI r12, 5
  WINSYS r12
  ADD r13, r9
retile_w3:

  ; Tile window 3
  JZ r14, retile_done
  MOV r11, r14
  MOV r2, r13
  LDI r10, 16
  LDI r12, 5
  WINSYS r12

retile_done:
  POP r12
  POP r13
  POP r9
  POP r15
  POP r10
  POP r2
  POP r11
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Draw Window Frame (title bar + border + close button) ──
; r11 = win_id
; ══════════════════════════════════════════════════════════════════
draw_window_frame:
  PUSH r31
  PUSH r11
  PUSH r2
  PUSH r10
  PUSH r15
  PUSH r9
  PUSH r13
  PUSH r12

  ; Get window info
  LDI r2, 0x9000
  LDI r12, 6         ; WINFO
  WINSYS r12
  JZ r11, frame_done  ; window not found

  ; Read winfo output
  LDI r25, 0x9000
  LOAD r10, r25      ; win_x
  LDI r25, 0x9001
  LOAD r15, r25      ; win_y
  LDI r25, 0x9002
  LOAD r9, r25      ; win_w
  LDI r25, 0x9003
  LOAD r13, r25      ; win_h

  ; ── Title bar (12px tall, dark purple) ──
  LDI r2, 0x444488
  MOV r12, r15         ; y = win_y
title_y:
  MOV r11, r10         ; x = win_x
title_x:
  PSET r11, r12, r2
  ADD r11, r3
  MOV r25, r10
  ADD r25, r9        ; x limit
  CMP r11, r25
  BLT r11, title_x
  ADD r12, r3
  LDI r25, 12
  ADD r25, r15        ; y limit (win_y + 12)
  CMP r12, r25
  BLT r11, title_y

  ; ── Close button (red 8x8 at top-right of title bar) ──
  ; Position: x = win_x + win_w - 11, y = win_y + 2
  MOV r25, r10
  ADD r25, r9
  LDI r26, 11
  SUB r25, r26       ; close_x = win_x + win_w - 11
  LDI r26, 2
  ADD r26, r15        ; close_y = win_y + 2

  LDI r2, 0xCC2222   ; red
  MOV r27, r26       ; y counter
close_y:
  MOV r11, r25        ; x counter
close_x:
  PSET r11, r27, r2
  ADD r11, r3
  MOV r28, r25
  LDI r29, 8
  ADD r28, r29
  CMP r11, r28
  BLT r11, close_x
  ADD r27, r3
  MOV r28, r26
  LDI r29, 8
  ADD r28, r29
  CMP r27, r28
  BLT r11, close_y

  ; ── Border outline (gray) ──
  LDI r2, 0x888888
  ; Left + right edges
  MOV r11, r15         ; y = win_y
border_y:
  PSET r10, r11, r2    ; left edge
  MOV r25, r10
  ADD r25, r9
  SUB r25, r3        ; right edge x
  PSET r25, r11, r2
  ADD r11, r3
  MOV r25, r15
  ADD r25, r13
  CMP r11, r25
  BLT r11, border_y

  ; Bottom edge
  MOV r11, r15
  ADD r11, r13
  SUB r11, r3         ; bottom y
  MOV r12, r10         ; x = win_x
bottom_x:
  PSET r12, r11, r2
  ADD r12, r3
  MOV r25, r10
  ADD r25, r9
  CMP r12, r25
  BLT r11, bottom_x

frame_done:
  POP r12
  POP r13
  POP r9
  POP r15
  POP r10
  POP r2
  POP r11
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 1 Content: Green background with H pattern ──
; ══════════════════════════════════════════════════════════════════
draw_win1_content:
  PUSH r31
  PUSH r11

  MOV r11, r0       ; win_id
  JZ r11, dw1_done

  ; Fill with dark green
  LDI r15, 0x003300
  LDI r9, 0
fill1_loop:
  LDI r12, 0
fill1_x:
  WPIXEL r11, r12, r9, r15
  ADD r12, r3
  LDI r25, 100
  CMP r12, r25
  BLT r11, fill1_x
  ADD r9, r3
  LDI r25, 80
  CMP r9, r25
  BLT r11, fill1_loop

  ; Draw a bright green H
  LDI r15, 0x00FF00
  LDI r9, 30
  LDI r12, 40
h_left:
  WPIXEL r11, r12, r9, r15
  ADD r9, r3
  LDI r25, 60
  CMP r9, r25
  BLT r11, h_left

  LDI r9, 30
  LDI r12, 50
h_right:
  WPIXEL r11, r12, r9, r15
  ADD r9, r3
  LDI r25, 60
  CMP r9, r25
  BLT r11, h_right

  LDI r9, 44
  LDI r12, 40
h_bar:
  WPIXEL r11, r12, r9, r15
  ADD r12, r3
  LDI r25, 51
  CMP r12, r25
  BLT r11, h_bar

dw1_done:
  POP r11
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 2 Content: Blue background with counter bar ──
; ══════════════════════════════════════════════════════════════════
draw_win2_content:
  PUSH r31
  PUSH r11

  MOV r11, r7       ; win_id
  JZ r11, dw2_done

  ; Fill with dark blue
  LDI r15, 0x000044
  LDI r9, 0
fill2_loop:
  LDI r12, 0
fill2_x:
  WPIXEL r11, r12, r9, r15
  ADD r12, r3
  LDI r25, 100
  CMP r12, r25
  BLT r11, fill2_x
  ADD r9, r3
  LDI r25, 80
  CMP r9, r25
  BLT r11, fill2_loop

  ; Draw counter bar
  LDI r15, 0xFFFFFF
  LDI r9, 40
  MOV r13, r18
  LDI r25, 90
  MOD r13, r25
  ADD r13, r3
  LDI r12, 5
bar_loop:
  CMP r12, r13
  BGE r11, bar_done
  WPIXEL r11, r12, r9, r15
  ADD r12, r3
  JMP bar_loop
bar_done:

dw2_done:
  POP r11
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 3 Content: Animated color stripes ──
; ══════════════════════════════════════════════════════════════════
draw_win3_content:
  PUSH r31
  PUSH r11
  PUSH r2
  PUSH r10

  MOV r11, r14       ; win_id
  JZ r11, dw3_done

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r9, 0
stripe_y:
  LDI r12, 0
stripe_x:
  MOV r2, r12
  ADD r2, r26
  LDI r25, 31
  AND r2, r25
  LDI r25, 3
  MUL r2, r25
  LDI r25, 8
  SHL r2, r25
  MOV r15, r9
  LDI r10, 7
  AND r15, r10
  LDI r25, 16
  SHL r15, r25
  OR r2, r15
  MOV r15, r2

  WPIXEL r11, r12, r9, r15
  ADD r12, r3
  LDI r25, 100
  CMP r12, r25
  BLT r11, stripe_x

  ADD r9, r3
  LDI r25, 80
  CMP r9, r25
  BLT r11, stripe_y

dw3_done:
  POP r10
  POP r2
  POP r11
  POP r31
  RET
