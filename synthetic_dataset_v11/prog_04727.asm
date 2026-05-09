; DESCRIPTION: Composite: . Then Draws a purple circle centered at (151, 201) with radius 52. Then Draws a blue line from (206, 54) to (78, 243).
; PLAN: r0=151(x), r1=201(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=206(x1), r1=54(y1), r2=78(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (151, 201) with radius 52.
; PLAN: r0=151(x), r1=201(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 201
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (206, 54) to (78, 243).
; PLAN: r0=206(x1), r1=54(y1), r2=78(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 54
LDI r2, 78
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
