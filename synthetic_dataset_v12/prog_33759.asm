; DESCRIPTION: Draws a green rectangle at (236, 17) with width 18 and height 25.
; PLAN: r0=236(x), r1=17(y), r2=18(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 17
LDI r2, 18
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
