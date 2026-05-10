; DESCRIPTION: Draws a green rectangle at (338, 95) with width 15 and height 68.
; PLAN: r0=338(x), r1=95(y), r2=15(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 95
LDI r2, 15
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
