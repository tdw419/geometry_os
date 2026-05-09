; DESCRIPTION: Draws a black rectangle at (188, 21) with width 25 and height 28.
; PLAN: r0=188(x), r1=21(y), r2=25(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 21
LDI r2, 25
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
