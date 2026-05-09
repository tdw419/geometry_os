; DESCRIPTION: Creates a blue rectangular region at (145, 118) spanning 83 by 57 pixels.
; PLAN: r0=145(x), r1=118(y), r2=83(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 118
LDI r2, 83
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
