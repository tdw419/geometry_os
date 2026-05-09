; DESCRIPTION: Creates a purple rectangular region at (132, 92) spanning 43 by 75 pixels.
; PLAN: r0=132(x), r1=92(y), r2=43(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 92
LDI r2, 43
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
