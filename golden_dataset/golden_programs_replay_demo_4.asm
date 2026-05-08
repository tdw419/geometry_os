; DESCRIPTION: Draws a colored object at the screen with fixed size.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r14, 1         ; mode = start recording
  SNAP_TRACE r14      ; begin trace recording

  LDI r6, 0         ; frame counter
  LDI r2, 16        ; total frames to draw
  LDI r7, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r12, 0
  FILL r12

  ; Draw a vertical bar at position r7
  LDI r11, 0          ; y = 0
  LDI r3, 256        ; y limit
  LDI r5, 0x00FF00   ; green bar color
  LDI r15, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r7, r11)
  LDI r13, 0
bar_x:
  LDI r1, 0
  ADD r1, r7
  ADD r1, r13         ; x = bar_pos + offset
  SCREENP r1, r11, r5    ; set pixel
  LDI r4, 1
  ADD r13, r4
  CMP r13, r15
  BLT r9, bar_x

  LDI r4, 1
  ADD r11, r4
  CMP r11, r3
  BLT r9, bar_y

  ; Advance bar position
  LDI r4, 16
  ADD r7, r4

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r4, 1
  ADD r6, r4
  CMP r6, r2
  BLT r9, draw_loop

  ; Stop recording
  LDI r14, 0
  SNAP_TRACE r14

  ; Now replay backward: show frames from newest to oldest
  LDI r10, 0         ; replay index (0 = newest)

replay_loop:
  LDI r14, 0
  ADD r14, r10        ; frame index to replay
  REPLAY r14

  ; Small delay between replay frames
  LDI r8, 0
delay:
  LDI r0, 1
  ADD r8, r0
  CMP r8, r2       ; short delay
  BLT r9, delay

  LDI r4, 1
  ADD r10, r4
  CMP r10, r2       ; replay all 16 frames
  BLT r9, replay_loop

  HALT
