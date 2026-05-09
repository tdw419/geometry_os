; DESCRIPTION: Draws a black rectangle at (458, 51) with width 45 and height 71.
; PLAN: r0=458(x), r1=51(y), r2=45(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 51
LDI r2, 45
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
