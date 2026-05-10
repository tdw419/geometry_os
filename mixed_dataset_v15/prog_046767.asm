; DESCRIPTION: Draws a orange rectangle at (350, 106) with width 86 and height 69.
; PLAN: r0=350(x), r1=106(y), r2=86(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 106
LDI r2, 86
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
