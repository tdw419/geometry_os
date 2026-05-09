; DESCRIPTION: Renders a blue box of size 35x36 starting at (159, 21).
; PLAN: r0=159(x), r1=21(y), r2=35(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 21
LDI r2, 35
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
