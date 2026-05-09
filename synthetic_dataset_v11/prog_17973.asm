; DESCRIPTION: Draws a red rectangle at (108, 155) with width 51 and height 80.
; PLAN: r0=108(x), r1=155(y), r2=51(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 155
LDI r2, 51
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
