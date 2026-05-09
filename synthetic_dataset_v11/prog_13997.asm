; DESCRIPTION: Creates a green rectangular region at (24, 161) spanning 54 by 15 pixels.
; PLAN: r0=24(x), r1=161(y), r2=54(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 161
LDI r2, 54
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
