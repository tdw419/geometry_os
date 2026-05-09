; DESCRIPTION: Draws a orange rectangle at (138, 86) with width 86 and height 51.
; PLAN: r0=138(x), r1=86(y), r2=86(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 86
LDI r2, 86
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
