; DESCRIPTION: Renders a blue box of size 81x71 starting at (47, 29).
; PLAN: r0=47(x), r1=29(y), r2=81(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 29
LDI r2, 81
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
