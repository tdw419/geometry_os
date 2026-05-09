; DESCRIPTION: Draws a black rectangle at (136, 103) with width 44 and height 83.
; PLAN: r0=136(x), r1=103(y), r2=44(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 103
LDI r2, 44
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
