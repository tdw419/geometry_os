; DESCRIPTION: Draws a blue rectangle at (89, 126) with width 108 and height 52.
; PLAN: r0=89(x), r1=126(y), r2=108(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 126
LDI r2, 108
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
