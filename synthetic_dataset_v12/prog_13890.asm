; DESCRIPTION: Draws a yellow rectangle at (184, 35) with width 79 and height 65.
; PLAN: r0=184(x), r1=35(y), r2=79(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 35
LDI r2, 79
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
