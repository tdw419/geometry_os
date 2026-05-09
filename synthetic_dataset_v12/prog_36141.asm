; DESCRIPTION: Renders a blue box of size 43x74 starting at (9, 87).
; PLAN: r0=9(x), r1=87(y), r2=43(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 87
LDI r2, 43
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
