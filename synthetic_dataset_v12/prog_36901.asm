; DESCRIPTION: Creates a blue rectangular region at (378, 105) spanning 84 by 84 pixels.
; PLAN: r0=378(x), r1=105(y), r2=84(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 105
LDI r2, 84
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
