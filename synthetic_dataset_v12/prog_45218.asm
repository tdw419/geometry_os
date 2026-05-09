; DESCRIPTION: Draws a yellow rectangle at (399, 77) with width 107 and height 71.
; PLAN: r0=399(x), r1=77(y), r2=107(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 77
LDI r2, 107
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
