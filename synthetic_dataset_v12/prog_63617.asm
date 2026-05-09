; DESCRIPTION: Draws a orange rectangle at (165, 3) with width 35 and height 107.
; PLAN: r0=165(x), r1=3(y), r2=35(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 3
LDI r2, 35
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
