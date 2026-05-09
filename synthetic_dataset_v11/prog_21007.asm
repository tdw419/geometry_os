; DESCRIPTION: Draws a yellow rectangle at (28, 123) with width 27 and height 105.
; PLAN: r0=28(x), r1=123(y), r2=27(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 123
LDI r2, 27
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
