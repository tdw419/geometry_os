; DESCRIPTION: Renders a blue rectangular region spanning 119 by 68 at (316, 143).
; PLAN: r0=316(x), r1=143(y), r2=119(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 143
LDI r2, 119
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
