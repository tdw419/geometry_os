; DESCRIPTION: Creates a yellow rectangular region at (186, 130) spanning 105 by 19 pixels.
; PLAN: r0=186(x), r1=130(y), r2=105(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 130
LDI r2, 105
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
