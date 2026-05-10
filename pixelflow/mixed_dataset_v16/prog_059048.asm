; DESCRIPTION: Draws a yellow rectangle at (223, 58) with width 108 and height 101.
; PLAN: r0=223(x), r1=58(y), r2=108(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 58
LDI r2, 108
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
