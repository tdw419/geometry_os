; DESCRIPTION: Renders a blue box of size 36x96 starting at (37, 43).
; PLAN: r0=37(x), r1=43(y), r2=36(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 43
LDI r2, 36
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
