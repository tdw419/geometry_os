; DESCRIPTION: Draws a orange rectangle at (84, 30) with width 51 and height 27.
; PLAN: r0=84(x), r1=30(y), r2=51(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 30
LDI r2, 51
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
