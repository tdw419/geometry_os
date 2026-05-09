; DESCRIPTION: Draws a green rectangle at (153, 75) with width 117 and height 79.
; PLAN: r0=153(x), r1=75(y), r2=117(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 75
LDI r2, 117
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
