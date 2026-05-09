; DESCRIPTION: Renders a blue box of size 43x39 starting at (181, 185).
; PLAN: r0=181(x), r1=185(y), r2=43(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 185
LDI r2, 43
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
