; DESCRIPTION: Draws a orange rectangle at (164, 117) with width 23 and height 51.
; PLAN: r0=164(x), r1=117(y), r2=23(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 117
LDI r2, 23
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
