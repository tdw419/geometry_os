; DESCRIPTION: Creates a purple rectangular region at (223, 89) spanning 72 by 73 pixels.
; PLAN: r0=223(x), r1=89(y), r2=72(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 89
LDI r2, 72
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
