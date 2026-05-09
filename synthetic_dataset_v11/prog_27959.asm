; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (175, 97) to (176, 219). Then Creates a green circular shape at (155, 118) with radius 72.
; PLAN: r0=175(x1), r1=97(y1), r2=176(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=118(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (175, 97) to (176, 219).
; PLAN: r0=175(x1), r1=97(y1), r2=176(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 97
LDI r2, 176
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (155, 118) with radius 72.
; PLAN: r0=155(x), r1=118(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 118
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
