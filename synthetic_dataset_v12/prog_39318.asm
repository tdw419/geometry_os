; DESCRIPTION: Draws a yellow rectangle at (221, 88) with width 57 and height 24.
; PLAN: r0=221(x), r1=88(y), r2=57(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 88
LDI r2, 57
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
