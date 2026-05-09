; DESCRIPTION: Composite: . Then Draws a yellow line from (230, 189) to (200, 152). Then Draws a black rectangle at (159, 108) with width 89 and height 19.
; PLAN: r0=230(x1), r1=189(y1), r2=200(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=159(x), r1=108(y), r2=89(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow line from (230, 189) to (200, 152).
; PLAN: r0=230(x1), r1=189(y1), r2=200(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 189
LDI r2, 200
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black rectangle at (159, 108) with width 89 and height 19.
; PLAN: r0=159(x), r1=108(y), r2=89(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 108
LDI r2, 89
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
