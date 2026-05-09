; DESCRIPTION: Draws a yellow rectangle at (303, 48) with width 114 and height 90.
; PLAN: r0=303(x), r1=48(y), r2=114(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 48
LDI r2, 114
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
