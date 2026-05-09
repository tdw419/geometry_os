; DESCRIPTION: Renders a blue box of size 80x28 starting at (74, 145).
; PLAN: r0=74(x), r1=145(y), r2=80(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 145
LDI r2, 80
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
