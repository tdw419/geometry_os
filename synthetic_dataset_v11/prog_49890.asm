; DESCRIPTION: Renders a purple box of size 91x114 starting at (82, 79).
; PLAN: r0=82(x), r1=79(y), r2=91(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 79
LDI r2, 91
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
