; DESCRIPTION: Draws a green rectangle at (208, 113) with width 45 and height 114.
; PLAN: r0=208(x), r1=113(y), r2=45(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 113
LDI r2, 45
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
