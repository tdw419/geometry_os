; DESCRIPTION: Creates a purple rectangular region at (84, 29) spanning 72 by 18 pixels.
; PLAN: r0=84(x), r1=29(y), r2=72(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 29
LDI r2, 72
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
