; DESCRIPTION: Draws a green rectangle at (43, 45) with width 103 and height 53.
; PLAN: r0=43(x), r1=45(y), r2=103(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 45
LDI r2, 103
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
