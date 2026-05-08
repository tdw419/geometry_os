; DESCRIPTION: Render a colored object at the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r10, 1         ; mode = start recording
  SNAP_TRACE r10      ; begin trace recording

  LDI r2, 0         ; frame counter
  LDI r12, 16        ; total frames to draw
  LDI r8, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r14, 0
  FILL r14

  ; Draw a vertical bar at position r8
  LDI r0, 0          ; y = 0
  LDI r6, 256        ; y limit
  LDI r5, 0x00FF00   ; green bar color
  LDI r3, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r8, r0)
  LDI r11, 0
bar_x:
  LDI r7, 0
  ADD r7, r8
  ADD r7, r11         ; x = bar_pos + offset
  SCREENP r7, r0, r5    ; set pixel
  LDI r4, 1
  ADD r11, r4
  CMP r11, r3
  BLT r1, bar_x

  LDI r4, 1
  ADD r0, r4
  CMP r0, r6
  BLT r1, bar_y

  ; Advance bar position
  LDI r4, 16
  ADD r8, r4

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r4, 1
  ADD r2, r4
  CMP r2, r12
  BLT r1, draw_loop

  ; Stop recording
  LDI r10, 0
  SNAP_TRACE r10

  ; Now replay backward: show frames from newest to oldest
  LDI r13, 0         ; replay index (0 = newest)

replay_loop:
  LDI r10, 0
  ADD r10, r13        ; frame index to replay
  REPLAY r10

  ; Small delay between replay frames
  LDI r9, 0
delay:
  LDI r15, 1
  ADD r9, r15
  CMP r9, r12       ; short delay
  BLT r1, delay

  LDI r4, 1
  ADD r13, r4
  CMP r13, r12       ; replay all 16 frames
  BLT r1, replay_loop

  HALT
