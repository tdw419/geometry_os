; DESCRIPTION: Draws a orange rectangle at (12, 1) with width 21 and height 51.
; PLAN: r0=12(x), r1=1(y), r2=21(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 1
LDI r2, 21
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
