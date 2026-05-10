; DESCRIPTION: Draws a yellow rectangle at (343, 109) with width 71 and height 18.
; PLAN: r0=343(x), r1=109(y), r2=71(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 109
LDI r2, 71
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
