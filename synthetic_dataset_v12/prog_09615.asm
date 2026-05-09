; DESCRIPTION: Draws a purple rectangle at (238, 89) with width 59 and height 50.
; PLAN: r0=238(x), r1=89(y), r2=59(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 89
LDI r2, 59
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
