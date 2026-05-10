; DESCRIPTION: Renders a yellow rectangular region spanning 12 by 51 at (265, 142).
; PLAN: r0=265(x), r1=142(y), r2=12(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 142
LDI r2, 12
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
