; DESCRIPTION: Draws a orange rectangle at (83, 65) with width 37 and height 67.
; PLAN: r0=83(x), r1=65(y), r2=37(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 65
LDI r2, 37
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
