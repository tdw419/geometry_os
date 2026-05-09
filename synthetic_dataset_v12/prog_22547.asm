; DESCRIPTION: Renders a purple box of size 113x118 starting at (211, 17).
; PLAN: r0=211(x), r1=17(y), r2=113(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 17
LDI r2, 113
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
