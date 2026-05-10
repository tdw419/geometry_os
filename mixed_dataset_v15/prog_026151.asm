; DESCRIPTION: Draws a yellow rectangle at (220, 57) with width 17 and height 38.
; PLAN: r0=220(x), r1=57(y), r2=17(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 57
LDI r2, 17
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
