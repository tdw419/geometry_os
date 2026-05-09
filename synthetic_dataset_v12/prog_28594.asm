; DESCRIPTION: Creates a blue rectangular region at (190, 51) spanning 11 by 114 pixels.
; PLAN: r0=190(x), r1=51(y), r2=11(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 51
LDI r2, 11
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
