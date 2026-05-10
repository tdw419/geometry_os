; DESCRIPTION: Draws a black rectangle at (408, 94) with width 29 and height 102.
; PLAN: r0=408(x), r1=94(y), r2=29(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 94
LDI r2, 29
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
