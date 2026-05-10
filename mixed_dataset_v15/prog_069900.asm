; DESCRIPTION: Draws a yellow rectangle at (93, 193) with width 62 and height 18.
; PLAN: r0=93(x), r1=193(y), r2=62(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 193
LDI r2, 62
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
