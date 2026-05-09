; DESCRIPTION: Draws a yellow rectangle at (235, 155) with width 102 and height 59.
; PLAN: r0=235(x), r1=155(y), r2=102(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 155
LDI r2, 102
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
