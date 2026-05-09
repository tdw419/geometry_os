; DESCRIPTION: Draws a green rectangle at (225, 132) with width 27 and height 118.
; PLAN: r0=225(x), r1=132(y), r2=27(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 132
LDI r2, 27
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
