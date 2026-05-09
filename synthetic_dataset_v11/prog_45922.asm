; DESCRIPTION: Draws a green rectangle at (24, 150) with width 35 and height 10.
; PLAN: r0=24(x), r1=150(y), r2=35(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 150
LDI r2, 35
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
