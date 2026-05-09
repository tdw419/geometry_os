; DESCRIPTION: Creates a purple rectangular region at (187, 80) spanning 51 by 110 pixels.
; PLAN: r0=187(x), r1=80(y), r2=51(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 80
LDI r2, 51
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
