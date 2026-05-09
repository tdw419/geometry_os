; DESCRIPTION: Draws a yellow rectangle at (129, 24) with width 44 and height 10.
; PLAN: r0=129(x), r1=24(y), r2=44(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 24
LDI r2, 44
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
