; DESCRIPTION: Draws a green rectangle at (271, 95) with width 52 and height 116.
; PLAN: r0=271(x), r1=95(y), r2=52(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 95
LDI r2, 52
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
