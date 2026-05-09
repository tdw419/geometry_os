; DESCRIPTION: Creates a yellow rectangular region at (161, 110) spanning 52 by 84 pixels.
; PLAN: r0=161(x), r1=110(y), r2=52(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 110
LDI r2, 52
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
