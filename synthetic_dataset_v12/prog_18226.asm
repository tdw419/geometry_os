; DESCRIPTION: Draws a orange rectangle at (179, 17) with width 11 and height 120.
; PLAN: r0=179(x), r1=17(y), r2=11(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 17
LDI r2, 11
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
