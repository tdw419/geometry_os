; DESCRIPTION: Draws a yellow rectangle at (386, 110) with width 25 and height 53.
; PLAN: r0=386(x), r1=110(y), r2=25(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 110
LDI r2, 25
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
