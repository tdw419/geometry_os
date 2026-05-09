; DESCRIPTION: Draws a black rectangle at (225, 5) with width 54 and height 117.
; PLAN: r0=225(x), r1=5(y), r2=54(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 5
LDI r2, 54
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
