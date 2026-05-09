; DESCRIPTION: Draws a green rectangle at (449, 54) with width 14 and height 109.
; PLAN: r0=449(x), r1=54(y), r2=14(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 54
LDI r2, 14
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
