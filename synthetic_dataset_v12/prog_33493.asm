; DESCRIPTION: Creates a green rectangular region at (337, 91) spanning 22 by 36 pixels.
; PLAN: r0=337(x), r1=91(y), r2=22(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 91
LDI r2, 22
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
