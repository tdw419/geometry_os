; DESCRIPTION: Draws a green rectangle at (107, 50) with width 13 and height 30.
; PLAN: r0=107(x), r1=50(y), r2=13(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 50
LDI r2, 13
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
