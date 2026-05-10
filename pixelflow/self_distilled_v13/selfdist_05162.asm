; DESCRIPTION: Renders a blue rectangular region spanning 66 by 107 at (78, 29).
; PLAN: r0=78(x), r1=29(y), r2=66(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 29
LDI r2, 66
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
