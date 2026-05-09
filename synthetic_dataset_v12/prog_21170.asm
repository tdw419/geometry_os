; DESCRIPTION: Renders a blue box of size 57x43 starting at (159, 185).
; PLAN: r0=159(x), r1=185(y), r2=57(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 185
LDI r2, 57
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
