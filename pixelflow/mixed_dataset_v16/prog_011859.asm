; DESCRIPTION: Draws a orange rectangle at (111, 151) with width 11 and height 69.
; PLAN: r0=111(x), r1=151(y), r2=11(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 151
LDI r2, 11
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
