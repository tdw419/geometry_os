; DESCRIPTION: Draws a yellow rectangle at (235, 36) with width 72 and height 60.
; PLAN: r0=235(x), r1=36(y), r2=72(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 36
LDI r2, 72
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
