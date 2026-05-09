; DESCRIPTION: Draws a green rectangle at (81, 141) with width 91 and height 11.
; PLAN: r0=81(x), r1=141(y), r2=91(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 141
LDI r2, 91
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
