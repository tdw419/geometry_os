; DESCRIPTION: Draws a yellow rectangle at (393, 5) with width 84 and height 53.
; PLAN: r0=393(x), r1=5(y), r2=84(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 5
LDI r2, 84
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
