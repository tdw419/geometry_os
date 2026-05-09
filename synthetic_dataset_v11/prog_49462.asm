; DESCRIPTION: Draws a yellow rectangle at (10, 18) with width 114 and height 103.
; PLAN: r0=10(x), r1=18(y), r2=114(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 18
LDI r2, 114
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
