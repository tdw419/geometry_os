; DESCRIPTION: Creates a green rectangular region at (13, 125) spanning 91 by 20 pixels.
; PLAN: r0=13(x), r1=125(y), r2=91(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 125
LDI r2, 91
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
