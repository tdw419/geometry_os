; DESCRIPTION: Draws a orange rectangle at (405, 119) with width 90 and height 45.
; PLAN: r0=405(x), r1=119(y), r2=90(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 119
LDI r2, 90
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
