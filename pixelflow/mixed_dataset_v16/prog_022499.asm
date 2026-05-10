; DESCRIPTION: Renders a blue rectangular region spanning 70 by 89 at (106, 196).
; PLAN: r0=106(x), r1=196(y), r2=70(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 196
LDI r2, 70
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
