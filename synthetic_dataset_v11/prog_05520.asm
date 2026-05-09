; DESCRIPTION: Draws a orange rectangle at (178, 13) with width 34 and height 83.
; PLAN: r0=178(x), r1=13(y), r2=34(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 13
LDI r2, 34
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
