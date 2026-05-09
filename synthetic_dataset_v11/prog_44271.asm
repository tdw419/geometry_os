; DESCRIPTION: Draws a yellow rectangle at (74, 52) with width 65 and height 27.
; PLAN: r0=74(x), r1=52(y), r2=65(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 52
LDI r2, 65
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
