; DESCRIPTION: Renders a purple box of size 63x36 starting at (88, 18).
; PLAN: r0=88(x), r1=18(y), r2=63(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 18
LDI r2, 63
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
