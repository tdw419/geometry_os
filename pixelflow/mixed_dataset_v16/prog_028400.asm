; DESCRIPTION: Creates a purple rectangular region at (226, 130) spanning 36 by 40 pixels.
; PLAN: r0=226(x), r1=130(y), r2=36(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 130
LDI r2, 36
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
