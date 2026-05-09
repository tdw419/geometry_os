; DESCRIPTION: Draws a yellow rectangle at (46, 30) with width 56 and height 83.
; PLAN: r0=46(x), r1=30(y), r2=56(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 30
LDI r2, 56
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
