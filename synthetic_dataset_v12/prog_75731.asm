; DESCRIPTION: Draws a orange rectangle at (338, 115) with width 113 and height 51.
; PLAN: r0=338(x), r1=115(y), r2=113(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 115
LDI r2, 113
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
