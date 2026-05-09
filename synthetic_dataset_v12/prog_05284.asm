; DESCRIPTION: Creates a purple rectangular region at (390, 130) spanning 15 by 54 pixels.
; PLAN: r0=390(x), r1=130(y), r2=15(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 130
LDI r2, 15
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
