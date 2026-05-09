; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (195, 181) with radius 39. Then Places a purple line segment connecting (5, 131) to (48, 206).
; PLAN: r0=195(x), r1=181(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=5(x1), r1=131(y1), r2=48(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (195, 181) with radius 39.
; PLAN: r0=195(x), r1=181(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 181
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (5, 131) to (48, 206).
; PLAN: r0=5(x1), r1=131(y1), r2=48(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 131
LDI r2, 48
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
