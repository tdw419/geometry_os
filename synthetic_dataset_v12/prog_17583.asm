; DESCRIPTION: Draws a green rectangle at (402, 30) with width 53 and height 95.
; PLAN: r0=402(x), r1=30(y), r2=53(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 30
LDI r2, 53
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
