; DESCRIPTION: Renders a white rectangular region spanning 87 by 17 at (44, 51).
; PLAN: r0=44(x), r1=51(y), r2=87(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 51
LDI r2, 87
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
