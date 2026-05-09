; DESCRIPTION: Draws a yellow rectangle at (314, 93) with width 63 and height 83.
; PLAN: r0=314(x), r1=93(y), r2=63(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 93
LDI r2, 63
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
