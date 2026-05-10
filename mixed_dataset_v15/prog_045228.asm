; DESCRIPTION: Draws a yellow rectangle at (213, 105) with width 23 and height 19.
; PLAN: r0=213(x), r1=105(y), r2=23(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 105
LDI r2, 23
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
