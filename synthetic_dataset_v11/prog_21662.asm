; DESCRIPTION: Creates a yellow rectangular region at (25, 130) spanning 80 by 88 pixels.
; PLAN: r0=25(x), r1=130(y), r2=80(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 130
LDI r2, 80
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
