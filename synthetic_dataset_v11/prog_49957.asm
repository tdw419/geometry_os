; DESCRIPTION: Creates a blue rectangular region at (47, 71) spanning 112 by 19 pixels.
; PLAN: r0=47(x), r1=71(y), r2=112(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 71
LDI r2, 112
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
