; DESCRIPTION: Draws a orange rectangle at (61, 55) with width 117 and height 90.
; PLAN: r0=61(x), r1=55(y), r2=117(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 55
LDI r2, 117
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
