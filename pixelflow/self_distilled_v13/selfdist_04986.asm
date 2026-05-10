; DESCRIPTION: Draws a yellow rectangle at (361, 131) with width 69 and height 66.
; PLAN: r0=361(x), r1=131(y), r2=69(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 131
LDI r2, 69
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
