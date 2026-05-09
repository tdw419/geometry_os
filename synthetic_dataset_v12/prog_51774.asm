; DESCRIPTION: Creates a purple rectangular region at (450, 185) spanning 51 by 53 pixels.
; PLAN: r0=450(x), r1=185(y), r2=51(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 185
LDI r2, 51
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
