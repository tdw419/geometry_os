; DESCRIPTION: Draws a yellow rectangle at (18, 91) with width 20 and height 79.
; PLAN: r0=18(x), r1=91(y), r2=20(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 91
LDI r2, 20
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
