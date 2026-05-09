; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (150, 79) to (151, 211). Then Draws a green circle centered at (136, 224) with radius 11.
; PLAN: r0=150(x1), r1=79(y1), r2=151(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=136(x), r1=224(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (150, 79) to (151, 211).
; PLAN: r0=150(x1), r1=79(y1), r2=151(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 79
LDI r2, 151
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (136, 224) with radius 11.
; PLAN: r0=136(x), r1=224(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 224
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
