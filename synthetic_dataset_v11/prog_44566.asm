; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (82, 192) with radius 58. Then Places a black line segment connecting (52, 21) to (3, 148).
; PLAN: r0=82(x), r1=192(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=52(x1), r1=21(y1), r2=3(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (82, 192) with radius 58.
; PLAN: r0=82(x), r1=192(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 192
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black line segment connecting (52, 21) to (3, 148).
; PLAN: r0=52(x1), r1=21(y1), r2=3(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 21
LDI r2, 3
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
