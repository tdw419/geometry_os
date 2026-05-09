; DESCRIPTION: Draws a green rectangle at (55, 53) with width 55 and height 68.
; PLAN: r0=55(x), r1=53(y), r2=55(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 53
LDI r2, 55
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
