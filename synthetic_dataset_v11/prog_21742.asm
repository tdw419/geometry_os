; DESCRIPTION: Composite: . Then Draws a blue line from (120, 178) to (206, 52). Then Draws a yellow rectangle at (148, 84) with width 51 and height 59.
; PLAN: r0=120(x1), r1=178(y1), r2=206(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=148(x), r1=84(y), r2=51(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue line from (120, 178) to (206, 52).
; PLAN: r0=120(x1), r1=178(y1), r2=206(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 178
LDI r2, 206
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (148, 84) with width 51 and height 59.
; PLAN: r0=148(x), r1=84(y), r2=51(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 84
LDI r2, 51
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
