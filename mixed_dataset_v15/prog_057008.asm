; DESCRIPTION: Creates a yellow rectangular region at (200, 32) spanning 75 by 118 pixels.
; PLAN: r0=200(x), r1=32(y), r2=75(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 32
LDI r2, 75
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
