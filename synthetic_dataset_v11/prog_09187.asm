; DESCRIPTION: Composite: . Then Places a black line segment connecting (80, 94) to (216, 245). Then Draws a white circle centered at (196, 29) with radius 11.
; PLAN: r0=80(x1), r1=94(y1), r2=216(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=196(x), r1=29(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (80, 94) to (216, 245).
; PLAN: r0=80(x1), r1=94(y1), r2=216(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 94
LDI r2, 216
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (196, 29) with radius 11.
; PLAN: r0=196(x), r1=29(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 29
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
