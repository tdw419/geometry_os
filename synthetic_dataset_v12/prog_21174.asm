; DESCRIPTION: Creates a green rectangular region at (189, 187) spanning 35 by 13 pixels.
; PLAN: r0=189(x), r1=187(y), r2=35(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 187
LDI r2, 35
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
