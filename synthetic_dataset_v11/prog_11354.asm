; DESCRIPTION: Draws a black rectangle at (148, 59) with width 74 and height 96.
; PLAN: r0=148(x), r1=59(y), r2=74(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 59
LDI r2, 74
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
