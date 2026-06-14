; test_hilbert_opcodes.asm - Test HILBERT_XY2D, HILBERT_D2XY
; Draws pixel at (5,5): green=pass, red=fail
; HILBERT_XY2D r_d, r_x, r_y  (0x3B)
; HILBERT_D2XY r_x, r_y, r_d  (0x3C)
; CMP rd, rs sets r0 to -1/0/1
; JNZ reg, addr jumps if reg != 0

; Test 1: XY2D(0,0) = 0
  LDI r1, 0
  LDI r2, 0
  HILBERT_XY2D r3, r1, r2
  LDI r4, 0
  CMP r3, r4
  JNZ r0, fail

; Test 2: XY2D(1,0) = 1
  LDI r1, 1
  LDI r2, 0
  HILBERT_XY2D r3, r1, r2
  LDI r4, 1
  CMP r3, r4
  JNZ r0, fail

; Test 3: XY2D(0,1) = 3
  LDI r1, 0
  LDI r2, 1
  HILBERT_XY2D r3, r1, r2
  LDI r4, 3
  CMP r3, r4
  JNZ r0, fail

; Test 4: XY2D(1,1) = 2
  LDI r1, 1
  LDI r2, 1
  HILBERT_XY2D r3, r1, r2
  LDI r4, 2
  CMP r3, r4
  JNZ r0, fail

; Test 5: D2XY(1) -> (1,0)
  LDI r1, 1
  HILBERT_D2XY r2, r3, r1
  LDI r4, 1
  CMP r2, r4
  JNZ r0, fail
  LDI r4, 0
  CMP r3, r4
  JNZ r0, fail

; All passed - green pixel at (5,5)
pass:
  LDI r10, 5
  LDI r11, 5
  LDI r12, 255
  PSET r10, r11, r12
  HALT

; Failed - red pixel at (5,5) via shift
fail:
  LDI r10, 5
  LDI r11, 5
  LDI r12, 255
  SHLI r12, 16
  PSET r10, r11, r12
  HALT
