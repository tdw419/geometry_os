; DESCRIPTION: Draws a yellow rectangle at (164, 76) with width 84 and height 47.
; PLAN: r0=164(x), r1=76(y), r2=84(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 76
LDI r2, 84
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
