; DESCRIPTION: Geometry OS program to draw a green object.

; window_desktop.asm -- Multi-window desktop demo (Phase 68b)
; Demonstrates WINSYS + MOUSEQ integration: drag, focus, multiple windows.
; Each window draws its own content into its offscreen buffer.
;
; Controls: Move mouse to interact. Click title bar to drag, click body to focus.
; Press Q to quit.

; ── Constants ──
LDI r5, 1
LDI r20, 0         ; zero constant

; ── Store title strings in RAM ──
LDI r8, 0x2000
STRO r8, "Hello"
LDI r8, 0x2020
STRO r8, "Counter"
LDI r8, 0x2040
STRO r8, "Colors"

; ── Create 3 windows ──

; Window 1: "Hello" at (20, 20), 100x80
LDI r3, 20
LDI r2, 20
LDI r7, 100
LDI r0, 80
LDI r15, 0x2000     ; title addr
LDI r8, 0          ; op=0 (create)
WINSYS r8
MOV r6, r4        ; r6 = win1_id

; Window 2: "Counter" at (140, 30), 100x80
LDI r3, 140
LDI r2, 30
LDI r7, 100
LDI r0, 80
LDI r15, 0x2020
LDI r8, 0
WINSYS r8
MOV r12, r4        ; r12 = win2_id

; Window 3: "Colors" at (60, 120), 100x80
LDI r3, 60
LDI r2, 120
LDI r7, 100
LDI r0, 80
LDI r15, 0x2040
LDI r8, 0
WINSYS r8
MOV r13, r4        ; r13 = win3_id

; ── Draw window contents ──

; Window 1: Green background with welcome text
CALL draw_win1

; Window 2: Blue background with counter
CALL draw_win2

; Window 3: Color stripes
CALL draw_win3

; ── Drag state ──
; r9 = dragging window id (0 = none)
; r16 = drag offset X
; r17 = drag offset Y
LDI r9, 0
LDI r16, 0
LDI r17, 0

; ── Counter for window 2 ──
LDI r18, 0         ; counter value

; ── Main loop ──
main_loop:
  FILL r20          ; clear screen to black

  ; Read mouse state: r21=mx, r22=my, r23=btn
  MOUSEQ r21

  ; Read keyboard
  IKEY r24
  LDI r25, 81       ; 'Q'
  CMP r24, r25
  JZ r4, quit

  ; ── Handle mouse button ──
  LDI r25, 2
  CMP r23, r25      ; click?
  BGE r4, check_drag

  ; Fresh click -- do hittest
  LDI r8, 4         ; op=4 (hittest)
  WINSYS r8         ; r4=win_id, r3=hit_type

  ; If no hit, skip
  JZ r4, no_click_action

  ; Bring clicked window to front
  LDI r8, 2         ; op=2 (bring to front)
  WINSYS r8

  ; Check hit type -- title bar = start drag
  LDI r25, 1
  CMP r3, r25       ; r3 = hit_type from hittest
  JNZ r4, no_click_action

  ; Start dragging (title bar hit)
  MOV r9, r4       ; r9 = dragging win_id

  ; Get window info for drag offset
  MOV r4, r9
  LDI r3, 0x9000    ; winfo dest addr
  LDI r8, 6         ; op=6 (winfo)
  WINSYS r8

  ; drag_ox = mouse_x - win_x
  LOAD r25, 0x9000  ; win_x
  MOV r26, r21
  SUB r26, r25      ; mx - win_x
  MOV r16, r26

  ; drag_oy = mouse_y - win_y
  LOAD r25, 0x9001  ; win_y
  MOV r26, r22
  SUB r26, r25      ; my - win_y
  MOV r17, r26

  JMP no_click_action

check_drag:
  ; If not dragging, skip
  JZ r9, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r4, r9       ; win_id
  MOV r3, r21
  SUB r3, r16       ; new_x = mx - drag_ox
  MOV r2, r22
  SUB r2, r17       ; new_y = my - drag_oy
  LDI r8, 5         ; op=5 (moveto)
  WINSYS r8

  JMP no_click_action

stop_drag:
  LDI r9, 0        ; stop dragging
  JMP no_click_action

no_click_action:

  ; ── Update counter (throttled to ~2/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 31
  AND r26, r27      ; TICKS & 31
  JNZ r26, skip_counter
  ADD r18, r5       ; counter++
  CALL draw_win2    ; redraw with new counter
skip_counter:

  ; ── Animate colors window (~4/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25
  LDI r27, 15
  AND r26, r27
  JNZ r26, skip_colors
  CALL draw_win3
skip_colors:

  ; ── Draw window borders and title bars on screen ──
  ; Window 1 border
  MOV r4, r6
  CALL draw_window_frame

  ; Window 2 border
  MOV r4, r12
  CALL draw_window_frame

  ; Window 3 border
  MOV r4, r13
  CALL draw_window_frame

  FRAME
  JMP main_loop

quit:
  HALT

; ── Draw Window 1: Green background ──
draw_win1:
  PUSH r31
  PUSH r4
  MOV r4, r6       ; win_id

  ; Fill with dark green
  LDI r7, 0x003300  ; dark green
  LDI r0, 0         ; y
fill1_loop:
  LDI r8, 0         ; x
fill1_x:
  WPIXEL r4, r8, r0, r7
  ADD r8, r5        ; x++
  LDI r25, 100
  CMP r8, r25
  BLT r4, fill1_x
  ADD r0, r5        ; y++
  LDI r25, 80
  CMP r0, r25
  BLT r4, fill1_loop

  ; Draw a bright green H in the center
  LDI r7, 0x00FF00  ; bright green
  ; Left vertical of H
  LDI r0, 30
  LDI r8, 40
h_left:
  WPIXEL r4, r8, r0, r7
  WPIXEL r4, r8, r0, r7
  ADD r0, r5
  LDI r25, 60
  CMP r0, r25
  BLT r4, h_left

  ; Right vertical of H
  LDI r0, 30
  LDI r8, 48
h_right:
  WPIXEL r4, r8, r0, r7
  ADD r0, r5
  LDI r25, 60
  CMP r0, r25
  BLT r4, h_right

  ; Crossbar of H
  LDI r0, 44
  LDI r8, 40
h_bar:
  WPIXEL r4, r8, r0, r7
  ADD r8, r5
  LDI r25, 49
  CMP r8, r25
  BLT r4, h_bar

  POP r4
  POP r31
  RET

; ── Draw Window 2: Blue background with counter bar ──
draw_win2:
  PUSH r31
  PUSH r4

  MOV r4, r12       ; win_id

  ; Fill with dark blue
  LDI r7, 0x000033  ; dark blue
  LDI r0, 0
fill2_loop:
  LDI r8, 0
fill2_x:
  WPIXEL r4, r8, r0, r7
  ADD r8, r5
  LDI r25, 100
  CMP r8, r25
  BLT r4, fill2_x
  ADD r0, r5
  LDI r25, 80
  CMP r0, r25
  BLT r4, fill2_loop

  ; Draw counter bar (white bar, length = counter % 90 + 5)
  LDI r7, 0xFFFFFF  ; white
  LDI r0, 40        ; y position
  MOV r15, r18
  LDI r25, 90
  MOD r15, r25
  ADD r15, r5        ; +1 = at least 1 pixel
  LDI r8, 5         ; x offset
bar_loop:
  CMP r8, r15
  BGE r4, bar_done
  WPIXEL r4, r8, r0, r7
  ADD r8, r5
  JMP bar_loop
bar_done:

  POP r4
  POP r31
  RET

; ── Draw Window 3: Animated color stripes ──
draw_win3:
  PUSH r31
  PUSH r4
  PUSH r3
  PUSH r2

  MOV r4, r13       ; win_id

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r0, 0         ; y
stripe_y:
  LDI r8, 0         ; x
stripe_x:
  ; Color from position + time
  MOV r3, r8
  ADD r3, r26       ; x + ticks
  LDI r25, 31
  AND r3, r25       ; (x + ticks) & 31
  LDI r25, 3
  MUL r3, r25       ; 0-93
  LDI r25, 8
  SHL r3, r25       ; shift into green channel
  MOV r7, r0
  LDI r2, 7
  AND r7, r2        ; y & 7
  LDI r25, 16
  SHL r7, r25       ; red channel
  OR r3, r7         ; combine
  MOV r7, r3

  WPIXEL r4, r8, r0, r7
  ADD r8, r5        ; x++
  LDI r25, 100
  CMP r8, r25
  BLT r4, stripe_x

  ADD r0, r5        ; y++
  LDI r25, 80
  CMP r0, r25
  BLT r4, stripe_y

  POP r2
  POP r3
  POP r4
  POP r31
  RET

; ── Draw window frame (title bar + border) on screen ──
; r4 = win_id
draw_window_frame:
  PUSH r31
  PUSH r4
  PUSH r3
  PUSH r2
  PUSH r7
  PUSH r0
  PUSH r15
  PUSH r8

  ; Get window info
  MOV r4, r4
  LDI r3, 0x9200    ; winfo addr
  LDI r8, 6         ; WINFO
  WINSYS r8
  JZ r4, frame_done  ; window not found

  LOAD r2, 0x9200   ; win_x
  LOAD r7, 0x9201   ; win_y
  LOAD r0, 0x9202   ; win_w
  LOAD r15, 0x9203   ; win_h

  ; Title bar (12px tall, purple)
  LDI r3, 0x444488
  MOV r8, r7         ; y = win_y
title_y:
  MOV r4, r2         ; x = win_x
title_x:
  PSET r4, r8, r3
  ADD r4, r5
  MOV r25, r2
  ADD r25, r0        ; x limit
  CMP r4, r25
  BLT r4, title_x
  ADD r8, r5
  LDI r25, 12
  ADD r25, r7        ; y limit (win_y + 12)
  CMP r8, r25
  BLT r4, title_y

  ; Border outline (gray)
  LDI r3, 0x888888
  ; Left + right edges
  MOV r4, r7         ; y = win_y
border_y:
  PSET r2, r4, r3    ; left edge
  MOV r25, r2
  ADD r25, r0
  SUB r25, r5        ; right edge x
  PSET r25, r4, r3
  ADD r4, r5
  MOV r25, r7
  ADD r25, r15
  CMP r4, r25
  BLT r4, border_y

  ; Bottom edge
  MOV r4, r7
  ADD r4, r15
  SUB r4, r5         ; bottom y
  MOV r8, r2         ; x = win_x
bottom_x:
  PSET r8, r4, r3
  ADD r8, r5
  MOV r25, r2
  ADD r25, r0
  CMP r8, r25
  BLT r4, bottom_x

frame_done:
  POP r8
  POP r15
  POP r0
  POP r7
  POP r2
  POP r3
  POP r4
  POP r31
  RET
