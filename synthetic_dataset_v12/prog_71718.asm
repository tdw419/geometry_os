; DESCRIPTION: Draws a cyan rectangle at (369, 101) with width 119 and height 75.
; PLAN: r0=369(x), r1=101(y), r2=119(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 101
LDI r2, 119
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
