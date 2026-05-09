; DESCRIPTION: Composite: . Then Draws a green line from (147, 181) to (52, 232). Then Draws a blue circle centered at (107, 78) with radius 62.
; PLAN: r0=147(x1), r1=181(y1), r2=52(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=107(x), r1=78(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (147, 181) to (52, 232).
; PLAN: r0=147(x1), r1=181(y1), r2=52(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 181
LDI r2, 52
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (107, 78) with radius 62.
; PLAN: r0=107(x), r1=78(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 78
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
