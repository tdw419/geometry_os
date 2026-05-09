; DESCRIPTION: Draws a yellow rectangle at (139, 50) with width 117 and height 25.
; PLAN: r0=139(x), r1=50(y), r2=117(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 50
LDI r2, 117
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
