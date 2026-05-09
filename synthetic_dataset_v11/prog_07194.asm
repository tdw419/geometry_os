; DESCRIPTION: Composite: . Then Draws a green line from (130, 159) to (201, 157). Then Places a green circle of radius 39 at center (175, 145).
; PLAN: r0=130(x1), r1=159(y1), r2=201(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=175(x), r1=145(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (130, 159) to (201, 157).
; PLAN: r0=130(x1), r1=159(y1), r2=201(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 159
LDI r2, 201
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 39 at center (175, 145).
; PLAN: r0=175(x), r1=145(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 145
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
