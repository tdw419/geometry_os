; DESCRIPTION: Draws a green rectangle at (184, 51) with width 59 and height 89.
; PLAN: r0=184(x), r1=51(y), r2=59(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 51
LDI r2, 59
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
