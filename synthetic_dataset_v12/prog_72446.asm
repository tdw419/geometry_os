; DESCRIPTION: Creates a blue rectangular region at (419, 172) spanning 66 by 18 pixels.
; PLAN: r0=419(x), r1=172(y), r2=66(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 172
LDI r2, 66
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
