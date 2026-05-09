; DESCRIPTION: Draws a green rectangle at (435, 88) with width 53 and height 23.
; PLAN: r0=435(x), r1=88(y), r2=53(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 88
LDI r2, 53
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
