; DESCRIPTION: Renders a purple box of size 63x10 starting at (26, 13).
; PLAN: r0=26(x), r1=13(y), r2=63(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 13
LDI r2, 63
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
