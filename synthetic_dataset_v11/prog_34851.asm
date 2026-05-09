; DESCRIPTION: Renders a purple box of size 39x63 starting at (13, 15).
; PLAN: r0=13(x), r1=15(y), r2=39(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 15
LDI r2, 39
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
