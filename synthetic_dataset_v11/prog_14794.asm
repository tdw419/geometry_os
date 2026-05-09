; DESCRIPTION: Renders a blue box of size 56x81 starting at (159, 3).
; PLAN: r0=159(x), r1=3(y), r2=56(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 3
LDI r2, 56
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
