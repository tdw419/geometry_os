; DESCRIPTION: Creates a blue rectangular region at (132, 100) spanning 66 by 11 pixels.
; PLAN: r0=132(x), r1=100(y), r2=66(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 100
LDI r2, 66
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
