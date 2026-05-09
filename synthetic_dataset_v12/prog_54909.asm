; DESCRIPTION: Draws a orange rectangle at (301, 115) with width 32 and height 88.
; PLAN: r0=301(x), r1=115(y), r2=32(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 115
LDI r2, 32
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
