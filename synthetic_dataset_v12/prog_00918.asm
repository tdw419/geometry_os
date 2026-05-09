; DESCRIPTION: Draws a green rectangle at (176, 52) with width 65 and height 95.
; PLAN: r0=176(x), r1=52(y), r2=65(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 52
LDI r2, 65
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
