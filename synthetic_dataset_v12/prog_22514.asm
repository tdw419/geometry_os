; DESCRIPTION: Renders a blue box of size 71x74 starting at (6, 18).
; PLAN: r0=6(x), r1=18(y), r2=71(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 18
LDI r2, 71
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
