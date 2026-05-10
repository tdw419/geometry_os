; DESCRIPTION: Draws a yellow rectangle at (160, 1) with width 45 and height 84.
; PLAN: r0=160(x), r1=1(y), r2=45(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 1
LDI r2, 45
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
