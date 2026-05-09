; DESCRIPTION: Creates a purple rectangular region at (123, 115) spanning 56 by 84 pixels.
; PLAN: r0=123(x), r1=115(y), r2=56(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 115
LDI r2, 56
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
