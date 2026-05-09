; DESCRIPTION: Creates a blue rectangular region at (15, 130) spanning 70 by 26 pixels.
; PLAN: r0=15(x), r1=130(y), r2=70(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 130
LDI r2, 70
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
