; DESCRIPTION: Draws a orange rectangle at (123, 17) with width 115 and height 61.
; PLAN: r0=123(x), r1=17(y), r2=115(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 17
LDI r2, 115
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
