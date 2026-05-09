; DESCRIPTION: Draws a yellow rectangle at (129, 50) with width 94 and height 68.
; PLAN: r0=129(x), r1=50(y), r2=94(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 50
LDI r2, 94
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
