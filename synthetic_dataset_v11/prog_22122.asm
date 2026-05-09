; DESCRIPTION: Draws a yellow rectangle at (110, 21) with width 93 and height 51.
; PLAN: r0=110(x), r1=21(y), r2=93(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 21
LDI r2, 93
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
