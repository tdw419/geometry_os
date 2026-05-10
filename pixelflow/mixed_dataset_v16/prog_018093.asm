; DESCRIPTION: Draws a yellow rectangle at (223, 166) with width 11 and height 39.
; PLAN: r0=223(x), r1=166(y), r2=11(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 166
LDI r2, 11
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
