; DESCRIPTION: Creates a purple rectangular region at (277, 130) spanning 15 by 17 pixels.
; PLAN: r0=277(x), r1=130(y), r2=15(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 130
LDI r2, 15
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
