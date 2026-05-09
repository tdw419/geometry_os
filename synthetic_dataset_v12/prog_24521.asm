; DESCRIPTION: Draws a green rectangle at (292, 28) with width 13 and height 52.
; PLAN: r0=292(x), r1=28(y), r2=13(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 28
LDI r2, 13
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
