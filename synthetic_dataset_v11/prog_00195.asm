; DESCRIPTION: Creates a purple rectangular region at (106, 132) spanning 96 by 45 pixels.
; PLAN: r0=106(x), r1=132(y), r2=96(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 132
LDI r2, 96
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
