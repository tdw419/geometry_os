; DESCRIPTION: Draws a yellow rectangle at (171, 101) with width 55 and height 81.
; PLAN: r0=171(x), r1=101(y), r2=55(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 101
LDI r2, 55
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
