; DESCRIPTION: Composite: . Then Renders a blue line between points (211, 43) and (219, 74). Then Draws a red rectangle at (91, 138) with width 99 and height 14.
; PLAN: r0=211(x1), r1=43(y1), r2=219(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=91(x), r1=138(y), r2=99(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (211, 43) and (219, 74).
; PLAN: r0=211(x1), r1=43(y1), r2=219(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 43
LDI r2, 219
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (91, 138) with width 99 and height 14.
; PLAN: r0=91(x), r1=138(y), r2=99(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 138
LDI r2, 99
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
