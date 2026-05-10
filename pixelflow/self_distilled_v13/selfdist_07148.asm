; DESCRIPTION: Draws a orange rectangle at (329, 136) with width 83 and height 85.
; PLAN: r0=329(x), r1=136(y), r2=83(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 136
LDI r2, 83
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
