; DESCRIPTION: Creates a green rectangular region at (43, 125) spanning 115 by 31 pixels.
; PLAN: r0=43(x), r1=125(y), r2=115(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 125
LDI r2, 115
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
