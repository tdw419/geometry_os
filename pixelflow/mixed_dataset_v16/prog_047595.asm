; DESCRIPTION: Draws a yellow rectangle at (369, 103) with width 92 and height 74.
; PLAN: r0=369(x), r1=103(y), r2=92(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 103
LDI r2, 92
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
