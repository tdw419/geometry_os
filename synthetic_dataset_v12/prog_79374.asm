; DESCRIPTION: Draws a yellow rectangle at (189, 142) with width 30 and height 105.
; PLAN: r0=189(x), r1=142(y), r2=30(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 142
LDI r2, 30
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
