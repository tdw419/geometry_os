; DESCRIPTION: Draws a yellow rectangle at (325, 37) with width 98 and height 40.
; PLAN: r0=325(x), r1=37(y), r2=98(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 37
LDI r2, 98
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
