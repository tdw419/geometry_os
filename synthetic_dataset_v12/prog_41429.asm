; DESCRIPTION: Renders a purple box of size 106x25 starting at (270, 26).
; PLAN: r0=270(x), r1=26(y), r2=106(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 26
LDI r2, 106
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
