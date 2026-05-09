; DESCRIPTION: Draws a green rectangle at (402, 13) with width 68 and height 54.
; PLAN: r0=402(x), r1=13(y), r2=68(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 13
LDI r2, 68
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
