; DESCRIPTION: Renders a purple box of size 19x66 starting at (8, 115).
; PLAN: r0=8(x), r1=115(y), r2=19(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 115
LDI r2, 19
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
