; DESCRIPTION: Draws a yellow rectangle at (205, 74) with width 10 and height 105.
; PLAN: r0=205(x), r1=74(y), r2=10(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 74
LDI r2, 10
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
