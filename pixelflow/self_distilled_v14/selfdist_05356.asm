; DESCRIPTION: Draws a orange rectangle at (10, 18) with width 72 and height 108.
; PLAN: r0=10(x), r1=18(y), r2=72(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 18
LDI r2, 72
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
