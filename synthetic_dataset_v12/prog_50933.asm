; DESCRIPTION: Draws a black rectangle at (44, 0) with width 84 and height 46.
; PLAN: r0=44(x), r1=0(y), r2=84(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 0
LDI r2, 84
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
