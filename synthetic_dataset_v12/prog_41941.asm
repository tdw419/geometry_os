; DESCRIPTION: Draws a yellow rectangle at (239, 5) with width 89 and height 114.
; PLAN: r0=239(x), r1=5(y), r2=89(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 5
LDI r2, 89
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
