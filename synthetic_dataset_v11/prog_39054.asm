; DESCRIPTION: Composite: . Then Draws a black rectangle at (184, 29) with width 63 and height 17. Then Draws a blue line from (122, 240) to (11, 155).
; PLAN: r0=184(x), r1=29(y), r2=63(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=122(x1), r1=240(y1), r2=11(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (184, 29) with width 63 and height 17.
; PLAN: r0=184(x), r1=29(y), r2=63(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 29
LDI r2, 63
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue line from (122, 240) to (11, 155).
; PLAN: r0=122(x1), r1=240(y1), r2=11(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 240
LDI r2, 11
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
