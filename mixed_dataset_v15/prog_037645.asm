; DESCRIPTION: Draws a orange rectangle at (159, 204) with width 102 and height 15.
; PLAN: r0=159(x), r1=204(y), r2=102(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 204
LDI r2, 102
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
