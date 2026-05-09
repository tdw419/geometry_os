; DESCRIPTION: Creates a green rectangular region at (155, 135) spanning 60 by 97 pixels.
; PLAN: r0=155(x), r1=135(y), r2=60(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 135
LDI r2, 60
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
