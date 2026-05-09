; DESCRIPTION: Draws a yellow rectangle at (3, 108) with width 24 and height 87.
; PLAN: r0=3(x), r1=108(y), r2=24(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 108
LDI r2, 24
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
