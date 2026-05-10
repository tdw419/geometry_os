; DESCRIPTION: Draws a green rectangle at (28, 71) with width 115 and height 69.
; PLAN: r0=28(x), r1=71(y), r2=115(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 71
LDI r2, 115
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
