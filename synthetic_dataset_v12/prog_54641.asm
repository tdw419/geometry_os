; DESCRIPTION: Draws a yellow rectangle at (338, 103) with width 17 and height 26.
; PLAN: r0=338(x), r1=103(y), r2=17(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 103
LDI r2, 17
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
