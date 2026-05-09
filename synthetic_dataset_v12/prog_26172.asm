; DESCRIPTION: Creates a green rectangular region at (13, 90) spanning 112 by 52 pixels.
; PLAN: r0=13(x), r1=90(y), r2=112(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 90
LDI r2, 112
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
