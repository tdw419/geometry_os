; DESCRIPTION: Draws a red rectangle at (129, 17) with width 101 and height 102.
; PLAN: r0=129(x), r1=17(y), r2=101(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 17
LDI r2, 101
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
