; DESCRIPTION: Draws a yellow rectangle at (28, 183) with width 66 and height 54.
; PLAN: r0=28(x), r1=183(y), r2=66(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 183
LDI r2, 66
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
