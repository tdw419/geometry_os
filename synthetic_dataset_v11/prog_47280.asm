; DESCRIPTION: Draws a blue rectangle at (61, 43) with width 65 and height 115.
; PLAN: r0=61(x), r1=43(y), r2=65(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 43
LDI r2, 65
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
