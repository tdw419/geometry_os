; DESCRIPTION: Draws a blue rectangle at (266, 71) with width 26 and height 26.
; PLAN: r0=266(x), r1=71(y), r2=26(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 71
LDI r2, 26
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
