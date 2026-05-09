; DESCRIPTION: Creates a purple rectangular region at (484, 66) spanning 27 by 40 pixels.
; PLAN: r0=484(x), r1=66(y), r2=27(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 66
LDI r2, 27
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
