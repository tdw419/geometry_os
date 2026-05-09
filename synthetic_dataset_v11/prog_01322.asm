; DESCRIPTION: Draws a yellow rectangle at (4, 125) with width 68 and height 95.
; PLAN: r0=4(x), r1=125(y), r2=68(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 125
LDI r2, 68
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
