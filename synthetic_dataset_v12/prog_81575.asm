; DESCRIPTION: Draws a orange rectangle at (386, 123) with width 61 and height 110.
; PLAN: r0=386(x), r1=123(y), r2=61(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 123
LDI r2, 61
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
