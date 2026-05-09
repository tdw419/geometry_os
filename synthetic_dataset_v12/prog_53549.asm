; DESCRIPTION: Draws a yellow rectangle at (50, 17) with width 52 and height 50.
; PLAN: r0=50(x), r1=17(y), r2=52(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 17
LDI r2, 52
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
