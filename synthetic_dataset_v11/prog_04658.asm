; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (96, 152) with radius 45. Then Places a purple line segment connecting (206, 174) to (196, 140).
; PLAN: r0=96(x), r1=152(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=206(x1), r1=174(y1), r2=196(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (96, 152) with radius 45.
; PLAN: r0=96(x), r1=152(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 152
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (206, 174) to (196, 140).
; PLAN: r0=206(x1), r1=174(y1), r2=196(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 174
LDI r2, 196
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
