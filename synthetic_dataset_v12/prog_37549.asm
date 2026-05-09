; DESCRIPTION: Creates a purple rectangular region at (27, 153) spanning 66 by 89 pixels.
; PLAN: r0=27(x), r1=153(y), r2=66(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 153
LDI r2, 66
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
