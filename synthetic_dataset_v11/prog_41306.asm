; DESCRIPTION: Composite: . Then Places a purple line segment connecting (193, 211) to (217, 11). Then Draws a green circle centered at (115, 68) with radius 35.
; PLAN: r0=193(x1), r1=211(y1), r2=217(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=115(x), r1=68(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (193, 211) to (217, 11).
; PLAN: r0=193(x1), r1=211(y1), r2=217(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 211
LDI r2, 217
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (115, 68) with radius 35.
; PLAN: r0=115(x), r1=68(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 68
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
