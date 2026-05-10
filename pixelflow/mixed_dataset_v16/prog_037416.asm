; DESCRIPTION: Renders a purple box of size 40x73 starting at (343, 13).
; PLAN: r0=343(x), r1=13(y), r2=40(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 13
LDI r2, 40
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
