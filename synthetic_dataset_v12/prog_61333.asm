; DESCRIPTION: Draws a black rectangle at (0, 109) with width 84 and height 83.
; PLAN: r0=0(x), r1=109(y), r2=84(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 109
LDI r2, 84
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
