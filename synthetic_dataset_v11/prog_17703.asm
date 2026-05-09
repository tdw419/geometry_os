; DESCRIPTION: Draws a green rectangle at (15, 8) with width 71 and height 53.
; PLAN: r0=15(x), r1=8(y), r2=71(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 8
LDI r2, 71
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
