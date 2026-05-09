; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (132, 27) to (211, 220). Then Creates a black circular shape at (126, 52) with radius 31.
; PLAN: r0=132(x1), r1=27(y1), r2=211(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=126(x), r1=52(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (132, 27) to (211, 220).
; PLAN: r0=132(x1), r1=27(y1), r2=211(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 27
LDI r2, 211
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (126, 52) with radius 31.
; PLAN: r0=126(x), r1=52(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 52
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
