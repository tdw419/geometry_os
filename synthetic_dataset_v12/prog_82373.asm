; DESCRIPTION: Draws a orange rectangle at (439, 123) with width 61 and height 112.
; PLAN: r0=439(x), r1=123(y), r2=61(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 123
LDI r2, 61
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
