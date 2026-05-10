; DESCRIPTION: Draws a yellow rectangle at (235, 157) with width 108 and height 118.
; PLAN: r0=235(x), r1=157(y), r2=108(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 157
LDI r2, 108
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
