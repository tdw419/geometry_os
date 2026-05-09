; DESCRIPTION: Draws a orange rectangle at (354, 177) with width 19 and height 35.
; PLAN: r0=354(x), r1=177(y), r2=19(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 177
LDI r2, 19
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
