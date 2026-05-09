; DESCRIPTION: Draws a green rectangle at (10, 35) with width 61 and height 89.
; PLAN: r0=10(x), r1=35(y), r2=61(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 35
LDI r2, 61
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
