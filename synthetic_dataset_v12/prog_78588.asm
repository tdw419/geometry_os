; DESCRIPTION: Creates a purple rectangular region at (7, 131) spanning 72 by 119 pixels.
; PLAN: r0=7(x), r1=131(y), r2=72(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 131
LDI r2, 72
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
