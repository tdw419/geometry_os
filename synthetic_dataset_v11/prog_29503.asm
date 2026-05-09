; DESCRIPTION: Renders a purple box of size 63x119 starting at (96, 64).
; PLAN: r0=96(x), r1=64(y), r2=63(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 64
LDI r2, 63
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
