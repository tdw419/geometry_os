; DESCRIPTION: Draws a yellow rectangle at (26, 105) with width 111 and height 61.
; PLAN: r0=26(x), r1=105(y), r2=111(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 105
LDI r2, 111
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
