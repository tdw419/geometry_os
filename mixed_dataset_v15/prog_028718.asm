; DESCRIPTION: Places a yellow 32x37 rectangle at position (428, 183).
; PLAN: r0=428(x), r1=183(y), r2=32(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 183
LDI r2, 32
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
