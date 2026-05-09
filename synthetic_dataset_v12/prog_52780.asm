; DESCRIPTION: Draws a yellow rectangle at (212, 63) with width 45 and height 114.
; PLAN: r0=212(x), r1=63(y), r2=45(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 63
LDI r2, 45
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
