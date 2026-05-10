; DESCRIPTION: Draws a yellow rectangle at (247, 52) with width 62 and height 52.
; PLAN: r0=247(x), r1=52(y), r2=62(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 52
LDI r2, 62
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
