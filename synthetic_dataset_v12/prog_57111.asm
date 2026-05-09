; DESCRIPTION: Creates a blue rectangular region at (371, 51) spanning 119 by 99 pixels.
; PLAN: r0=371(x), r1=51(y), r2=119(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 51
LDI r2, 119
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
