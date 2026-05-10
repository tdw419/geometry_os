; DESCRIPTION: Creates a yellow rectangular region at (213, 130) spanning 118 by 15 pixels.
; PLAN: r0=213(x), r1=130(y), r2=118(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 130
LDI r2, 118
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
