; DESCRIPTION: Draws a yellow rectangle at (203, 207) with width 25 and height 39.
; PLAN: r0=203(x), r1=207(y), r2=25(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 207
LDI r2, 25
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
