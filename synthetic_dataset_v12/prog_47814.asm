; DESCRIPTION: Draws a yellow rectangle at (100, 19) with width 113 and height 46.
; PLAN: r0=100(x), r1=19(y), r2=113(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 19
LDI r2, 113
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
