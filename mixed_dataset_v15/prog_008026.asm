; DESCRIPTION: Draws a orange rectangle at (406, 92) with width 13 and height 75.
; PLAN: r0=406(x), r1=92(y), r2=13(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 92
LDI r2, 13
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
