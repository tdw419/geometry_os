; DESCRIPTION: Draws a green rectangle at (116, 50) with width 22 and height 74.
; PLAN: r0=116(x), r1=50(y), r2=22(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 50
LDI r2, 22
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
