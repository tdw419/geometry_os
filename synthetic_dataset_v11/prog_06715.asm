; DESCRIPTION: Draws a green rectangle at (53, 37) with width 100 and height 45.
; PLAN: r0=53(x), r1=37(y), r2=100(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 37
LDI r2, 100
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
