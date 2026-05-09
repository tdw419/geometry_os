; DESCRIPTION: Creates a green rectangular region at (227, 161) spanning 117 by 84 pixels.
; PLAN: r0=227(x), r1=161(y), r2=117(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 161
LDI r2, 117
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
