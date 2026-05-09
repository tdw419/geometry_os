; DESCRIPTION: Creates a yellow rectangular region at (8, 219) spanning 118 by 30 pixels.
; PLAN: r0=8(x), r1=219(y), r2=118(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 219
LDI r2, 118
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
