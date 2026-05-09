; DESCRIPTION: Draws a yellow rectangle at (292, 36) with width 13 and height 65.
; PLAN: r0=292(x), r1=36(y), r2=13(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 36
LDI r2, 13
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
