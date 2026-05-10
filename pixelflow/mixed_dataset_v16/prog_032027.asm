; DESCRIPTION: Draws a green rectangle at (30, 154) with width 78 and height 26.
; PLAN: r0=30(x), r1=154(y), r2=78(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 154
LDI r2, 78
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
