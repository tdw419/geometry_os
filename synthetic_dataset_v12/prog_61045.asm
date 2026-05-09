; DESCRIPTION: Draws a orange rectangle at (379, 44) with width 101 and height 88.
; PLAN: r0=379(x), r1=44(y), r2=101(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 44
LDI r2, 101
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
