; DESCRIPTION: Draws a green rectangle at (80, 138) with width 53 and height 54.
; PLAN: r0=80(x), r1=138(y), r2=53(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 138
LDI r2, 53
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
