; DESCRIPTION: Draws a green rectangle at (80, 96) with width 90 and height 23.
; PLAN: r0=80(x), r1=96(y), r2=90(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 96
LDI r2, 90
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
