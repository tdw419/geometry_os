; DESCRIPTION: Draws a green rectangle at (303, 69) with width 92 and height 114.
; PLAN: r0=303(x), r1=69(y), r2=92(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 69
LDI r2, 92
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
