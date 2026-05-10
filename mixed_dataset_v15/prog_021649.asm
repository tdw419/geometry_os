; DESCRIPTION: Draws a orange rectangle at (148, 36) with width 13 and height 20.
; PLAN: r0=148(x), r1=36(y), r2=13(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 36
LDI r2, 13
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
