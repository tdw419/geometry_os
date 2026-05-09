; DESCRIPTION: Draws a white rectangle at (172, 71) with width 51 and height 47.
; PLAN: r0=172(x), r1=71(y), r2=51(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 71
LDI r2, 51
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
