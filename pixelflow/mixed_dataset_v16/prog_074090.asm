; DESCRIPTION: Creates a green rectangular region at (359, 138) spanning 78 by 74 pixels.
; PLAN: r0=359(x), r1=138(y), r2=78(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 138
LDI r2, 78
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
