; DESCRIPTION: Draws a yellow rectangle at (170, 6) with width 116 and height 71.
; PLAN: r0=170(x), r1=6(y), r2=116(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 6
LDI r2, 116
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
