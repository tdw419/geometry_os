; DESCRIPTION: Draws a yellow rectangle at (142, 174) with width 103 and height 47.
; PLAN: r0=142(x), r1=174(y), r2=103(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 174
LDI r2, 103
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
