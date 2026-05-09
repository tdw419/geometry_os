; DESCRIPTION: Draws a red rectangle at (44, 54) with width 69 and height 29.
; PLAN: r0=44(x), r1=54(y), r2=69(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 54
LDI r2, 69
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
