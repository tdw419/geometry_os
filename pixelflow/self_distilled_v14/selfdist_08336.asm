; DESCRIPTION: Renders a blue rectangular region spanning 75 by 87 at (106, 119).
; PLAN: r0=106(x), r1=119(y), r2=75(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 119
LDI r2, 75
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
