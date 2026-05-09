; DESCRIPTION: Draws a yellow rectangle at (11, 7) with width 117 and height 44.
; PLAN: r0=11(x), r1=7(y), r2=117(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 7
LDI r2, 117
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
