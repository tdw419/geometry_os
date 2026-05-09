; DESCRIPTION: Draws a orange rectangle at (332, 64) with width 44 and height 110.
; PLAN: r0=332(x), r1=64(y), r2=44(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 64
LDI r2, 44
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
