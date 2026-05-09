; DESCRIPTION: Draws a yellow rectangle at (30, 39) with width 84 and height 98.
; PLAN: r0=30(x), r1=39(y), r2=84(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 39
LDI r2, 84
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
