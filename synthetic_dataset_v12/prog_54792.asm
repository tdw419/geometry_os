; DESCRIPTION: Renders a blue box of size 70x71 starting at (118, 51).
; PLAN: r0=118(x), r1=51(y), r2=70(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 51
LDI r2, 70
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
