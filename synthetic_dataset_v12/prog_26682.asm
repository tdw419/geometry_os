; DESCRIPTION: Draws a red rectangle at (264, 123) with width 114 and height 71.
; PLAN: r0=264(x), r1=123(y), r2=114(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 123
LDI r2, 114
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
