; DESCRIPTION: Renders a blue rectangular region spanning 80 by 107 at (148, 131).
; PLAN: r0=148(x), r1=131(y), r2=80(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 131
LDI r2, 80
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
