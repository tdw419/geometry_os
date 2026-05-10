; DESCRIPTION: Creates a green rectangular region at (15, 130) spanning 117 by 78 pixels.
; PLAN: r0=15(x), r1=130(y), r2=117(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 130
LDI r2, 117
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
