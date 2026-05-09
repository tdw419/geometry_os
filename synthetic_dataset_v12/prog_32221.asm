; DESCRIPTION: Draws a green rectangle at (286, 55) with width 91 and height 73.
; PLAN: r0=286(x), r1=55(y), r2=91(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 55
LDI r2, 91
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
