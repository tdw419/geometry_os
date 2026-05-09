; DESCRIPTION: Creates a purple rectangular region at (6, 150) spanning 118 by 100 pixels.
; PLAN: r0=6(x), r1=150(y), r2=118(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 150
LDI r2, 118
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
