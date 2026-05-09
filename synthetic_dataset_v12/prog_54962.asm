; DESCRIPTION: Draws a green rectangle at (68, 127) with width 61 and height 106.
; PLAN: r0=68(x), r1=127(y), r2=61(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 127
LDI r2, 61
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
