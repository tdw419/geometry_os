; DESCRIPTION: Draws a orange rectangle at (378, 24) with width 40 and height 55.
; PLAN: r0=378(x), r1=24(y), r2=40(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 24
LDI r2, 40
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
