; DESCRIPTION: Renders a blue rectangular region spanning 119 by 23 at (143, 107).
; PLAN: r0=143(x), r1=107(y), r2=119(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 107
LDI r2, 119
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
