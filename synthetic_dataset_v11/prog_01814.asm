; DESCRIPTION: Creates a blue rectangular region at (19, 172) spanning 112 by 67 pixels.
; PLAN: r0=19(x), r1=172(y), r2=112(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 172
LDI r2, 112
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
