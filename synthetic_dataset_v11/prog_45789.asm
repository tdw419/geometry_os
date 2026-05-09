; DESCRIPTION: Composite: . Then Draws a purple line from (201, 50) to (86, 248). Then Places a red circle of radius 46 at center (85, 74).
; PLAN: r0=201(x1), r1=50(y1), r2=86(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=85(x), r1=74(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (201, 50) to (86, 248).
; PLAN: r0=201(x1), r1=50(y1), r2=86(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 50
LDI r2, 86
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 46 at center (85, 74).
; PLAN: r0=85(x), r1=74(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 74
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
