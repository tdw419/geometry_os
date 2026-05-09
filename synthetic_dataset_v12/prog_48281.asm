; DESCRIPTION: Creates a blue rectangular region at (105, 71) spanning 77 by 89 pixels.
; PLAN: r0=105(x), r1=71(y), r2=77(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 71
LDI r2, 77
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
