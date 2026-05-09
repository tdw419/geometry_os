; DESCRIPTION: Composite: . Then Draws a blue circle centered at (141, 167) with radius 23. Then Places a yellow line segment connecting (170, 43) to (88, 126).
; PLAN: r0=141(x), r1=167(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=170(x1), r1=43(y1), r2=88(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (141, 167) with radius 23.
; PLAN: r0=141(x), r1=167(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 167
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (170, 43) to (88, 126).
; PLAN: r0=170(x1), r1=43(y1), r2=88(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 43
LDI r2, 88
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
