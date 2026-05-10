; DESCRIPTION: Renders a purple box of size 74x118 starting at (327, 70).
; PLAN: r0=327(x), r1=70(y), r2=74(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 70
LDI r2, 74
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
