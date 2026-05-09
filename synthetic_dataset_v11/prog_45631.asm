; DESCRIPTION: Draws a yellow rectangle at (32, 29) with width 36 and height 117.
; PLAN: r0=32(x), r1=29(y), r2=36(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 29
LDI r2, 36
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
