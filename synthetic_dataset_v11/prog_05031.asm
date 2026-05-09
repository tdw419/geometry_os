; DESCRIPTION: Creates a green rectangular region at (52, 38) spanning 118 by 91 pixels.
; PLAN: r0=52(x), r1=38(y), r2=118(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 38
LDI r2, 118
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
