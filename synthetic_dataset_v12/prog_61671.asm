; DESCRIPTION: Creates a purple rectangular region at (5, 15) spanning 119 by 98 pixels.
; PLAN: r0=5(x), r1=15(y), r2=119(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 15
LDI r2, 119
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
