; DESCRIPTION: Draws a blue rectangle at (234, 126) with width 93 and height 89.
; PLAN: r0=234(x), r1=126(y), r2=93(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 126
LDI r2, 93
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
