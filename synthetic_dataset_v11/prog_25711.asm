; DESCRIPTION: Composite: . Then Places a white line segment connecting (146, 17) to (147, 232). Then Draws a blue circle centered at (47, 157) with radius 40.
; PLAN: r0=146(x1), r1=17(y1), r2=147(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=47(x), r1=157(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (146, 17) to (147, 232).
; PLAN: r0=146(x1), r1=17(y1), r2=147(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 17
LDI r2, 147
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (47, 157) with radius 40.
; PLAN: r0=47(x), r1=157(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 157
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
