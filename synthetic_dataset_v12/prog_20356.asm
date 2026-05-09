; DESCRIPTION: Draws a black rectangle at (250, 125) with width 63 and height 54.
; PLAN: r0=250(x), r1=125(y), r2=63(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 125
LDI r2, 63
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
