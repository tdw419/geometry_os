; DESCRIPTION: Draws a green rectangle at (81, 46) with width 30 and height 38.
; PLAN: r0=81(x), r1=46(y), r2=30(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 46
LDI r2, 30
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
