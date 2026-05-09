; DESCRIPTION: Renders a purple box of size 46x105 starting at (52, 79).
; PLAN: r0=52(x), r1=79(y), r2=46(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 79
LDI r2, 46
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
