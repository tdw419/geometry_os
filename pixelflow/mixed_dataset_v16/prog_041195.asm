; DESCRIPTION: Draws a orange rectangle at (274, 108) with width 87 and height 117.
; PLAN: r0=274(x), r1=108(y), r2=87(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 108
LDI r2, 87
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
