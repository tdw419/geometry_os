; DESCRIPTION: Creates a yellow rectangular region at (359, 188) spanning 24 by 49 pixels.
; PLAN: r0=359(x), r1=188(y), r2=24(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 188
LDI r2, 24
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
