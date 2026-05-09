; DESCRIPTION: Draws a yellow rectangle at (46, 63) with width 72 and height 114.
; PLAN: r0=46(x), r1=63(y), r2=72(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 63
LDI r2, 72
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
