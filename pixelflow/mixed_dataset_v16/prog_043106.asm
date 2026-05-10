; DESCRIPTION: Draws a orange rectangle at (18, 137) with width 93 and height 83.
; PLAN: r0=18(x), r1=137(y), r2=93(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 137
LDI r2, 93
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
