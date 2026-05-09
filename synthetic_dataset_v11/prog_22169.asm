; DESCRIPTION: Creates a purple rectangular region at (145, 8) spanning 99 by 66 pixels.
; PLAN: r0=145(x), r1=8(y), r2=99(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 8
LDI r2, 99
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
