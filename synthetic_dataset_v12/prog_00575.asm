; DESCRIPTION: Creates a purple rectangular region at (377, 178) spanning 84 by 31 pixels.
; PLAN: r0=377(x), r1=178(y), r2=84(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 178
LDI r2, 84
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
