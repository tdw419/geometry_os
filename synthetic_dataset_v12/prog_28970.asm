; DESCRIPTION: Draws a yellow rectangle at (248, 55) with width 93 and height 75.
; PLAN: r0=248(x), r1=55(y), r2=93(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 55
LDI r2, 93
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
