; sine_wave.asm -- Overlapping sine wave visualizer
;
; Three colored waves with different frequencies and phase shifts,
; animated via the TICKS counter.
;
; Algorithm:
;   - Build a 256-entry wave table at 0x2000 using triangle approximation
;   - Each frame: clear screen, draw 3 waves, present with FRAME
;   - Wave 1 (red): period=256, phase=TICKS
;   - Wave 2 (green): period=128, phase=TICKS*2
;   - Wave 3 (blue): period=64, phase=TICKS*4
;
; Memory:
;   0x2000..0x20FF: wave lookup table

; === Constants ===
LDI r7, 1
LDI r10, 0x2000
LDI r11, 256
LDI r12, 0xFFE
LDI r20, 128
LDI r21, 255

; === Build wave table ===
; Table[i] = triangle wave: 128..255..128 for i=0..255
LDI r22, 0
build_loop:
  MOV r1, r22
  ANDI r1, 0x7F
  CMP r22, r20
  BLT r0, top_half
  ; bottom half: y = 255 - q
  MOV r2, r21
  SUB r2, r1
  JMP store_val
top_half:
  ; top half: y = 128 + q
  ADD r1, r20
  MOV r2, r1
store_val:
  MOV r3, r10
  ADD r3, r22
  STORE r3, r2
  ADD r22, r7
  CMP r22, r11
  BLT r0, build_loop

; === Main animation loop ===
frame_loop:
  ; Clear screen to black
  LDI r30, 0
  FILL r30

  ; Read TICKS for phase animation
  LOAD r5, r12

  ; === Draw Wave 1 (red, period=256) ===
  LDI r1, 0
wave1_loop:
  ; index = (x + phase) & 0xFF
  MOV r2, r1
  ADD r2, r5
  ANDI r2, 0xFF
  ; y = table[index]
  ADD r2, r10
  LOAD r3, r2
  ; color = red
  LDI r4, 0xFF0000
  LDI r30, 220
  BLEND r1, r3, r4, r30
  ADD r1, r7
  CMP r1, r11
  BLT r0, wave1_loop

  ; === Draw Wave 2 (green, period=128) ===
  LDI r1, 0
  MOV r6, r5
  SHL r6, r7
wave2_loop:
  ; index = (x*2 + phase*2) & 0xFF
  MOV r2, r1
  SHL r2, r7
  ADD r2, r6
  ANDI r2, 0xFF
  ADD r2, r10
  LOAD r3, r2
  LDI r4, 0x00FF00
  LDI r30, 220
  BLEND r1, r3, r4, r30
  ADD r1, r7
  CMP r1, r11
  BLT r0, wave2_loop

  ; === Draw Wave 3 (blue, period=64) ===
  LDI r1, 0
  MOV r6, r5
  SHL r6, r7
  SHL r6, r7
wave3_loop:
  ; index = (x*4 + phase*4) & 0xFF
  MOV r2, r1
  SHL r2, r7
  SHL r2, r7
  ADD r2, r6
  ANDI r2, 0xFF
  ADD r2, r10
  LOAD r3, r2
  LDI r4, 0x0000FF
  LDI r30, 220
  BLEND r1, r3, r4, r30
  ADD r1, r7
  CMP r1, r11
  BLT r0, wave3_loop

  FRAME
  JMP frame_loop
