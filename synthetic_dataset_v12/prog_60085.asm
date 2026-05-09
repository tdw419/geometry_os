; DESCRIPTION: Draws a yellow rectangle at (313, 140) with width 90 and height 91.
; PLAN: r0=313(x), r1=140(y), r2=90(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 140
LDI r2, 90
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
