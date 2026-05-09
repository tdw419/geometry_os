; DESCRIPTION: Creates a purple rectangular region at (237, 130) spanning 65 by 44 pixels.
; PLAN: r0=237(x), r1=130(y), r2=65(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 130
LDI r2, 65
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
