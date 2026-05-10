; DESCRIPTION: Draws a yellow rectangle at (8, 207) with width 74 and height 11.
; PLAN: r0=8(x), r1=207(y), r2=74(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 207
LDI r2, 74
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
