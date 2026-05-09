; DESCRIPTION: Draws a yellow rectangle at (71, 51) with width 120 and height 75.
; PLAN: r0=71(x), r1=51(y), r2=120(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 51
LDI r2, 120
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
