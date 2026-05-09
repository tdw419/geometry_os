; DESCRIPTION: Draws a yellow rectangle at (68, 65) with width 53 and height 26.
; PLAN: r0=68(x), r1=65(y), r2=53(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 65
LDI r2, 53
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
