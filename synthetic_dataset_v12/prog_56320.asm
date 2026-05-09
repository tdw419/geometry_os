; DESCRIPTION: Renders a purple box of size 118x19 starting at (178, 132).
; PLAN: r0=178(x), r1=132(y), r2=118(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 132
LDI r2, 118
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
