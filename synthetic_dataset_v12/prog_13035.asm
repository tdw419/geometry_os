; DESCRIPTION: Draws a orange rectangle at (378, 76) with width 108 and height 12.
; PLAN: r0=378(x), r1=76(y), r2=108(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 76
LDI r2, 108
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
