; DESCRIPTION: Renders a white rectangular region spanning 51 by 68 at (278, 107).
; PLAN: r0=278(x), r1=107(y), r2=51(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 107
LDI r2, 51
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
