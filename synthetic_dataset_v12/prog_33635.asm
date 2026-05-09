; DESCRIPTION: Renders a blue box of size 25x88 starting at (98, 118).
; PLAN: r0=98(x), r1=118(y), r2=25(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 118
LDI r2, 25
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
