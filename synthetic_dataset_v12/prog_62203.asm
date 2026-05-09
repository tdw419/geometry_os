; DESCRIPTION: Draws a orange rectangle at (84, 33) with width 23 and height 107.
; PLAN: r0=84(x), r1=33(y), r2=23(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 33
LDI r2, 23
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
