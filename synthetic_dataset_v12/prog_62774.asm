; DESCRIPTION: Renders a blue box of size 43x29 starting at (133, 1).
; PLAN: r0=133(x), r1=1(y), r2=43(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 1
LDI r2, 43
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
