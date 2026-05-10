; DESCRIPTION: Creates a purple filled rectangle of size 63x66 starting at (261, 52).
; PLAN: r0=261(x), r1=52(y), r2=63(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 52
LDI r2, 63
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
