; DESCRIPTION: Creates a blue rectangular region at (319, 106) spanning 112 by 73 pixels.
; PLAN: r0=319(x), r1=106(y), r2=112(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 106
LDI r2, 112
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
