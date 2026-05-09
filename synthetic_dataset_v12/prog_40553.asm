; DESCRIPTION: Draws a green rectangle at (114, 214) with width 114 and height 11.
; PLAN: r0=114(x), r1=214(y), r2=114(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 214
LDI r2, 114
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
