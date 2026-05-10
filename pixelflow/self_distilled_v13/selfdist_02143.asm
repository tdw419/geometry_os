; DESCRIPTION: Renders a cyan rectangular region spanning 43 by 75 at (232, 51).
; PLAN: r0=232(x), r1=51(y), r2=43(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 51
LDI r2, 43
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
