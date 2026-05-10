; DESCRIPTION: Renders a purple box of size 81x90 starting at (118, 127).
; PLAN: r0=118(x), r1=127(y), r2=81(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 127
LDI r2, 81
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
