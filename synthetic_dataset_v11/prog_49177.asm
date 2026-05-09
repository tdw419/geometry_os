; DESCRIPTION: Creates a green rectangular region at (15, 128) spanning 81 by 37 pixels.
; PLAN: r0=15(x), r1=128(y), r2=81(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 128
LDI r2, 81
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
