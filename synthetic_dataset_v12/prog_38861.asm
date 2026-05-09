; DESCRIPTION: Draws a green rectangle at (189, 3) with width 43 and height 30.
; PLAN: r0=189(x), r1=3(y), r2=43(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 3
LDI r2, 43
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
