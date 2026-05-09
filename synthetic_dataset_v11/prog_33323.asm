; DESCRIPTION: Draws a orange rectangle at (217, 136) with width 24 and height 31.
; PLAN: r0=217(x), r1=136(y), r2=24(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 136
LDI r2, 24
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
