; DESCRIPTION: Creates a purple rectangular region at (448, 21) spanning 52 by 73 pixels.
; PLAN: r0=448(x), r1=21(y), r2=52(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 21
LDI r2, 52
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
