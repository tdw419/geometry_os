; DESCRIPTION: Creates a blue rectangular region at (118, 118) spanning 15 by 18 pixels.
; PLAN: r0=118(x), r1=118(y), r2=15(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 118
LDI r2, 15
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
