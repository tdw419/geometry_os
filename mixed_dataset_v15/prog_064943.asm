; DESCRIPTION: Draws a yellow rectangle at (24, 26) with width 65 and height 102.
; PLAN: r0=24(x), r1=26(y), r2=65(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 26
LDI r2, 65
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
