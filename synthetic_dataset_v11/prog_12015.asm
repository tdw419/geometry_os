; DESCRIPTION: Creates a green rectangular region at (136, 85) spanning 78 by 109 pixels.
; PLAN: r0=136(x), r1=85(y), r2=78(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 85
LDI r2, 78
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
