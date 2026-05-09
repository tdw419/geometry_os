; DESCRIPTION: Creates a green rectangular region at (143, 19) spanning 22 by 52 pixels.
; PLAN: r0=143(x), r1=19(y), r2=22(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 19
LDI r2, 22
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
