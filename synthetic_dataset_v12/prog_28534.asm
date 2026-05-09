; DESCRIPTION: Creates a blue rectangular region at (358, 130) spanning 83 by 33 pixels.
; PLAN: r0=358(x), r1=130(y), r2=83(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 130
LDI r2, 83
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
