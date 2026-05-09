; DESCRIPTION: Draws a yellow rectangle at (33, 132) with width 116 and height 58.
; PLAN: r0=33(x), r1=132(y), r2=116(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 132
LDI r2, 116
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
