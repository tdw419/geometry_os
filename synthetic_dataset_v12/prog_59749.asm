; DESCRIPTION: Draws a yellow rectangle at (56, 16) with width 105 and height 91.
; PLAN: r0=56(x), r1=16(y), r2=105(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 16
LDI r2, 105
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
