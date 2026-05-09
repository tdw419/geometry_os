; DESCRIPTION: Draws a yellow rectangle at (20, 223) with width 94 and height 26.
; PLAN: r0=20(x), r1=223(y), r2=94(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 223
LDI r2, 94
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
