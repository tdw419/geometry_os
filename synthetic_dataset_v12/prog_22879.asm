; DESCRIPTION: Creates a green rectangular region at (359, 115) spanning 62 by 62 pixels.
; PLAN: r0=359(x), r1=115(y), r2=62(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 115
LDI r2, 62
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
