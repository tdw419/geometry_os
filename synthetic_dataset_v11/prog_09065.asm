; DESCRIPTION: Draws a yellow rectangle at (164, 4) with width 58 and height 114.
; PLAN: r0=164(x), r1=4(y), r2=58(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 4
LDI r2, 58
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
