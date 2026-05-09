; DESCRIPTION: Renders a purple box of size 84x118 starting at (127, 80).
; PLAN: r0=127(x), r1=80(y), r2=84(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 80
LDI r2, 84
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
