; DESCRIPTION: Creates a green rectangular region at (391, 115) spanning 110 by 52 pixels.
; PLAN: r0=391(x), r1=115(y), r2=110(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 115
LDI r2, 110
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
