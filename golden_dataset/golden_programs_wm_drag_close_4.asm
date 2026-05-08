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
;   r0  = constant 1
;   r20 = constant 0
;   r12-r6 = window IDs (0 if closed)
;   r14 = dragging window id (0 = none)
;   r16 = drag offset X
;   r17 = drag offset Y
;   r18 = animation counter
;   r21-r23 = mouse mx, my, btn (from MOUSEQ)
;   r24 = keyboard key (from IKEY)
;   r25-r29 = scratch
; ──────────────────────────────────────────────────────────────────

; ── Constants ──
LDI r0, 1
LDI r20, 0
LDI r30, 0xFF00

; ── Store title strings in RAM ──
LDI r1, 0x2000
STRO r1, "Draw"
LDI r1, 0x2020
STRO r1, "Status"
LDI r1, 0x2040
STRO r1, "Colors"

; ── Create 3 windows ──

; Window 1 "Draw" at (16, 16), 100x80
LDI r9, 16
LDI r11, 16
LDI r10, 100
LDI r5, 80
LDI r13, 0x2000
LDI r1, 0
WINSYS r1
MOV r12, r7

; Window 2 "Status" at (136, 16), 100x80
LDI r9, 136
LDI r11, 16
LDI r10, 100
LDI r5, 80
LDI r13, 0x2020
LDI r1, 0
WINSYS r1
MOV r2, r7

; Window 3 "Colors" at (76, 110), 100x80
LDI r9, 76
LDI r11, 110
LDI r10, 100
LDI r5, 80
LDI r13, 0x2040
LDI r1, 0
WINSYS r1
MOV r6, r7

; ── Draw initial window contents ──
CALL draw_win1_content
CALL draw_win2_content
CALL draw_win3_content

; ── Drag state ──
LDI r14, 0
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
  JZ r7, quit

  ; ── Handle mouse click ──
  LDI r25, 2
  CMP r23, r25      ; btn == 2 (click)?
  BGE r7, check_drag

  ; Fresh click -- do hittest
  LDI r1, 4         ; op=4 (hittest)
  WINSYS r1         ; r7=win_id, r9=hit_type

  ; If no hit, skip
  JZ r7, no_click_action

  ; Bring clicked window to front
  LDI r1, 2         ; op=2 (bring to front)
  WINSYS r1

  ; Save hit window id for later
  MOV r28, r7       ; r28 = hit_win_id

  ; ── Get window info for close button check ──
  LDI r9, 0x9000    ; winfo dest addr
  LDI r1, 6         ; op=6 (winfo)
  WINSYS r1

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
  LDI r1, 12
  SUB r29, r1       ; r29 = close_x

  ; Check if mouse is in close button area:
  ;   mx >= close_x AND mx < close_x + 10 AND my >= win_y AND my < win_y + 12

  ; Check mx >= close_x
  CMP r21, r29
  BLT r7, start_drag_check    ; mx < close_x, not on close button

  ; Check mx < close_x + 10
  MOV r1, r29
  LDI r25, 10
  ADD r1, r25       ; r1 = close_x + 10
  CMP r21, r1
  BGE r7, start_drag_check    ; mx >= close_x + 10, not on close button

  ; Check my >= win_y AND my < win_y + 12
  ; (r26 = win_y, already loaded)
  CMP r22, r26
  BLT r7, start_drag_check    ; my < win_y
  LDI r25, 12
  ADD r25, r26       ; win_y + 12
  CMP r22, r25
  BGE r7, start_drag_check    ; my >= win_y + 12

  ; ── Close button clicked! Destroy the window ──
  MOV r7, r28       ; restore hit window id
  LDI r1, 1         ; op=1 (destroy)
  WINSYS r1

  ; Clear the window id from our tracking
  CMP r12, r28
  JZ r7, closed_w1
  CMP r2, r28
  JZ r7, closed_w2
  LDI r6, 0
  JMP do_retile

closed_w1:
  LDI r12, 0
  JMP do_retile

closed_w2:
  LDI r2, 0

do_retile:
  CALL retile_windows
  JMP no_click_action

  ; ── Start drag (title bar hit, not close button) ──
start_drag_check:
  ; Re-do hittest for hit_type (r9 was overwritten by winfo)
  LDI r1, 4
  WINSYS r1          ; r7=win_id, r9=hit_type

  ; Check hit type -- title bar (1) = start drag
  LDI r25, 1
  CMP r9, r25
  JNZ r7, no_click_action

  ; Start dragging
  MOV r14, r7

  ; Get window info for drag offset
  LDI r9, 0x9000
  LDI r1, 6
  WINSYS r1

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
  JZ r14, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r7, r14       ; win_id
  MOV r9, r21
  SUB r9, r16       ; new_x = mx - drag_ox
  MOV r11, r22
  SUB r11, r17       ; new_y = my - drag_oy
  LDI r1, 5         ; op=5 (moveto)
  WINSYS r1

  JMP no_click_action

stop_drag:
  LDI r14, 0
  JMP no_click_action

no_click_action:

  ; ── Update animation counter (throttled) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 7
  AND r26, r27
  JNZ r26, skip_update
  ADD r18, r0
  CALL draw_win2_content
  CALL draw_win3_content
skip_update:

  ; ── Draw all window frames ──
  JZ r12, skip_frame1
  MOV r7, r12
  CALL draw_window_frame
skip_frame1:

  JZ r2, skip_frame2
  MOV r7, r2
  CALL draw_window_frame
skip_frame2:

  JZ r6, skip_frame3
  MOV r7, r6
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
  PUSH r7
  PUSH r9
  PUSH r11
  PUSH r10
  PUSH r5
  PUSH r13
  PUSH r1

  ; Count active windows
  LDI r10, 0
  JZ r12, ret_cnt2
  ADD r10, r0
ret_cnt2:
  JZ r2, ret_cnt3
  ADD r10, r0
ret_cnt3:
  JZ r6, ret_done_cnt
  ADD r10, r0
ret_done_cnt:

  ; If 0 windows, nothing to tile
  JZ r10, retile_done

  ; Compute tile width = 240 / count
  LDI r5, 240
  DIV r5, r10        ; r5 = tile_width
  LDI r25, 8
  MOV r13, r25       ; r13 = current_x (start at 8)

  ; Tile window 1
  JZ r12, retile_w2
  MOV r7, r12
  MOV r9, r13
  LDI r11, 16
  LDI r1, 5
  WINSYS r1
  ADD r13, r5
retile_w2:

  ; Tile window 2
  JZ r2, retile_w3
  MOV r7, r2
  MOV r9, r13
  LDI r11, 16
  LDI r1, 5
  WINSYS r1
  ADD r13, r5
retile_w3:

  ; Tile window 3
  JZ r6, retile_done
  MOV r7, r6
  MOV r9, r13
  LDI r11, 16
  LDI r1, 5
  WINSYS r1

retile_done:
  POP r1
  POP r13
  POP r5
  POP r10
  POP r11
  POP r9
  POP r7
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Draw Window Frame (title bar + border + close button) ──
; r7 = win_id
; ══════════════════════════════════════════════════════════════════
draw_window_frame:
  PUSH r31
  PUSH r7
  PUSH r9
  PUSH r11
  PUSH r10
  PUSH r5
  PUSH r13
  PUSH r1

  ; Get window info
  LDI r9, 0x9000
  LDI r1, 6         ; WINFO
  WINSYS r1
  JZ r7, frame_done  ; window not found

  ; Read winfo output
  LDI r25, 0x9000
  LOAD r11, r25      ; win_x
  LDI r25, 0x9001
  LOAD r10, r25      ; win_y
  LDI r25, 0x9002
  LOAD r5, r25      ; win_w
  LDI r25, 0x9003
  LOAD r13, r25      ; win_h

  ; ── Title bar (12px tall, dark purple) ──
  LDI r9, 0x444488
  MOV r1, r10         ; y = win_y
title_y:
  MOV r7, r11         ; x = win_x
title_x:
  PSET r7, r1, r9
  ADD r7, r0
  MOV r25, r11
  ADD r25, r5        ; x limit
  CMP r7, r25
  BLT r7, title_x
  ADD r1, r0
  LDI r25, 12
  ADD r25, r10        ; y limit (win_y + 12)
  CMP r1, r25
  BLT r7, title_y

  ; ── Close button (red 8x8 at top-right of title bar) ──
  ; Position: x = win_x + win_w - 11, y = win_y + 2
  MOV r25, r11
  ADD r25, r5
  LDI r26, 11
  SUB r25, r26       ; close_x = win_x + win_w - 11
  LDI r26, 2
  ADD r26, r10        ; close_y = win_y + 2

  LDI r9, 0xCC2222   ; red
  MOV r27, r26       ; y counter
close_y:
  MOV r7, r25        ; x counter
close_x:
  PSET r7, r27, r9
  ADD r7, r0
  MOV r28, r25
  LDI r29, 8
  ADD r28, r29
  CMP r7, r28
  BLT r7, close_x
  ADD r27, r0
  MOV r28, r26
  LDI r29, 8
  ADD r28, r29
  CMP r27, r28
  BLT r7, close_y

  ; ── Border outline (gray) ──
  LDI r9, 0x888888
  ; Left + right edges
  MOV r7, r10         ; y = win_y
border_y:
  PSET r11, r7, r9    ; left edge
  MOV r25, r11
  ADD r25, r5
  SUB r25, r0        ; right edge x
  PSET r25, r7, r9
  ADD r7, r0
  MOV r25, r10
  ADD r25, r13
  CMP r7, r25
  BLT r7, border_y

  ; Bottom edge
  MOV r7, r10
  ADD r7, r13
  SUB r7, r0         ; bottom y
  MOV r1, r11         ; x = win_x
bottom_x:
  PSET r1, r7, r9
  ADD r1, r0
  MOV r25, r11
  ADD r25, r5
  CMP r1, r25
  BLT r7, bottom_x

frame_done:
  POP r1
  POP r13
  POP r5
  POP r10
  POP r11
  POP r9
  POP r7
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 1 Content: Green background with H pattern ──
; ══════════════════════════════════════════════════════════════════
draw_win1_content:
  PUSH r31
  PUSH r7

  MOV r7, r12       ; win_id
  JZ r7, dw1_done

  ; Fill with dark green
  LDI r10, 0x003300
  LDI r5, 0
fill1_loop:
  LDI r1, 0
fill1_x:
  WPIXEL r7, r1, r5, r10
  ADD r1, r0
  LDI r25, 100
  CMP r1, r25
  BLT r7, fill1_x
  ADD r5, r0
  LDI r25, 80
  CMP r5, r25
  BLT r7, fill1_loop

  ; Draw a bright green H
  LDI r10, 0x00FF00
  LDI r5, 30
  LDI r1, 40
h_left:
  WPIXEL r7, r1, r5, r10
  ADD r5, r0
  LDI r25, 60
  CMP r5, r25
  BLT r7, h_left

  LDI r5, 30
  LDI r1, 50
h_right:
  WPIXEL r7, r1, r5, r10
  ADD r5, r0
  LDI r25, 60
  CMP r5, r25
  BLT r7, h_right

  LDI r5, 44
  LDI r1, 40
h_bar:
  WPIXEL r7, r1, r5, r10
  ADD r1, r0
  LDI r25, 51
  CMP r1, r25
  BLT r7, h_bar

dw1_done:
  POP r7
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 2 Content: Blue background with counter bar ──
; ══════════════════════════════════════════════════════════════════
draw_win2_content:
  PUSH r31
  PUSH r7

  MOV r7, r2       ; win_id
  JZ r7, dw2_done

  ; Fill with dark blue
  LDI r10, 0x000044
  LDI r5, 0
fill2_loop:
  LDI r1, 0
fill2_x:
  WPIXEL r7, r1, r5, r10
  ADD r1, r0
  LDI r25, 100
  CMP r1, r25
  BLT r7, fill2_x
  ADD r5, r0
  LDI r25, 80
  CMP r5, r25
  BLT r7, fill2_loop

  ; Draw counter bar
  LDI r10, 0xFFFFFF
  LDI r5, 40
  MOV r13, r18
  LDI r25, 90
  MOD r13, r25
  ADD r13, r0
  LDI r1, 5
bar_loop:
  CMP r1, r13
  BGE r7, bar_done
  WPIXEL r7, r1, r5, r10
  ADD r1, r0
  JMP bar_loop
bar_done:

dw2_done:
  POP r7
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 3 Content: Animated color stripes ──
; ══════════════════════════════════════════════════════════════════
draw_win3_content:
  PUSH r31
  PUSH r7
  PUSH r9
  PUSH r11

  MOV r7, r6       ; win_id
  JZ r7, dw3_done

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r5, 0
stripe_y:
  LDI r1, 0
stripe_x:
  MOV r9, r1
  ADD r9, r26
  LDI r25, 31
  AND r9, r25
  LDI r25, 3
  MUL r9, r25
  LDI r25, 8
  SHL r9, r25
  MOV r10, r5
  LDI r11, 7
  AND r10, r11
  LDI r25, 16
  SHL r10, r25
  OR r9, r10
  MOV r10, r9

  WPIXEL r7, r1, r5, r10
  ADD r1, r0
  LDI r25, 100
  CMP r1, r25
  BLT r7, stripe_x

  ADD r5, r0
  LDI r25, 80
  CMP r5, r25
  BLT r7, stripe_y

dw3_done:
  POP r11
  POP r9
  POP r7
  POP r31
  RET
