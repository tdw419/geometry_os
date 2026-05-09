; DESCRIPTION: Places a orange 64x16 rectangle at position (347, 60).
; PLAN: r0=347(x), r1=60(y), r2=64(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 60
LDI r2, 64
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
