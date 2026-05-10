; DESCRIPTION: Draws a yellow rectangle at (69, 196) with width 43 and height 107.
; PLAN: r0=69(x), r1=196(y), r2=43(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 196
LDI r2, 43
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
