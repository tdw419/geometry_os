; DESCRIPTION: Draws a purple rectangle at (317, 99) with width 55 and height 102.
; PLAN: r0=317(x), r1=99(y), r2=55(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 99
LDI r2, 55
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
