; DESCRIPTION: Draws a yellow rectangle at (56, 212) with width 39 and height 37.
; PLAN: r0=56(x), r1=212(y), r2=39(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 212
LDI r2, 39
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
