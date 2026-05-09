; DESCRIPTION: Draws a yellow rectangle at (1, 5) with width 63 and height 51.
; PLAN: r0=1(x), r1=5(y), r2=63(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 5
LDI r2, 63
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
