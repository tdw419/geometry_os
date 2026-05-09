; DESCRIPTION: Draws a green rectangle at (138, 91) with width 116 and height 60.
; PLAN: r0=138(x), r1=91(y), r2=116(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 91
LDI r2, 116
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
