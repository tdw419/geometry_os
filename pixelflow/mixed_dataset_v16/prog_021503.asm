; DESCRIPTION: Draws a orange rectangle at (34, 138) with width 13 and height 79.
; PLAN: r0=34(x), r1=138(y), r2=13(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 138
LDI r2, 13
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
