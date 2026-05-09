; DESCRIPTION: Draws a yellow rectangle at (73, 17) with width 50 and height 73.
; PLAN: r0=73(x), r1=17(y), r2=50(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 17
LDI r2, 50
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
