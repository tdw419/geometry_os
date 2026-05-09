; DESCRIPTION: Draws a red rectangle at (148, 136) with width 68 and height 11.
; PLAN: r0=148(x), r1=136(y), r2=68(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 136
LDI r2, 68
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
