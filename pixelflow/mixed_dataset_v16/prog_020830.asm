; DESCRIPTION: Renders a purple box of size 81x78 starting at (46, 156).
; PLAN: r0=46(x), r1=156(y), r2=81(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 156
LDI r2, 81
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
