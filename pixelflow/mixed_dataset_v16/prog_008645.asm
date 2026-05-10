; DESCRIPTION: Draws a black rectangle at (385, 44) with width 107 and height 101.
; PLAN: r0=385(x), r1=44(y), r2=107(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 44
LDI r2, 107
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
