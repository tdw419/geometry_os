; DESCRIPTION: Draws a yellow rectangle at (370, 114) with width 59 and height 117.
; PLAN: r0=370(x), r1=114(y), r2=59(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 114
LDI r2, 59
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
