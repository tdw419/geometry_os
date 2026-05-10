; DESCRIPTION: Renders a blue rectangular region spanning 25 by 94 at (10, 100).
; PLAN: r0=10(x), r1=100(y), r2=25(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 100
LDI r2, 25
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
