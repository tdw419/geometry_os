; DESCRIPTION: Renders a white rectangular region spanning 26 by 19 at (273, 51).
; PLAN: r0=273(x), r1=51(y), r2=26(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 51
LDI r2, 26
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
