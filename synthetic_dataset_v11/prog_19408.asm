; DESCRIPTION: Draws a orange rectangle at (26, 199) with width 111 and height 39.
; PLAN: r0=26(x), r1=199(y), r2=111(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 199
LDI r2, 111
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
