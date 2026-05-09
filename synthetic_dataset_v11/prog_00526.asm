; DESCRIPTION: Draws a yellow rectangle at (46, 132) with width 79 and height 100.
; PLAN: r0=46(x), r1=132(y), r2=79(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 132
LDI r2, 79
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
