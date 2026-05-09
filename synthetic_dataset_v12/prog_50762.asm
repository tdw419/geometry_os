; DESCRIPTION: Draws a yellow rectangle at (376, 43) with width 97 and height 56.
; PLAN: r0=376(x), r1=43(y), r2=97(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 43
LDI r2, 97
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
