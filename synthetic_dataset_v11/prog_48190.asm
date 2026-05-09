; DESCRIPTION: Draws a red rectangle at (26, 227) with width 39 and height 17.
; PLAN: r0=26(x), r1=227(y), r2=39(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 227
LDI r2, 39
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
