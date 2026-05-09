; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (132, 134) with radius 34. Then Places a black line segment connecting (138, 4) to (38, 101).
; PLAN: r0=132(x), r1=134(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=138(x1), r1=4(y1), r2=38(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (132, 134) with radius 34.
; PLAN: r0=132(x), r1=134(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 134
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black line segment connecting (138, 4) to (38, 101).
; PLAN: r0=138(x1), r1=4(y1), r2=38(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 4
LDI r2, 38
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
