; DESCRIPTION: Draws a yellow rectangle at (269, 109) with width 117 and height 114.
; PLAN: r0=269(x), r1=109(y), r2=117(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 109
LDI r2, 117
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
