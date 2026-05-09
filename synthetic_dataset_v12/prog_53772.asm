; DESCRIPTION: Draws a yellow rectangle at (267, 43) with width 50 and height 102.
; PLAN: r0=267(x), r1=43(y), r2=50(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 43
LDI r2, 50
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
