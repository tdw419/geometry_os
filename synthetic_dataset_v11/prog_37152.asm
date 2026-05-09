; DESCRIPTION: Composite: . Then Draws a purple line from (201, 182) to (74, 82). Then Renders a green disk with center (166, 211) and radius 11.
; PLAN: r0=201(x1), r1=182(y1), r2=74(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=166(x), r1=211(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (201, 182) to (74, 82).
; PLAN: r0=201(x1), r1=182(y1), r2=74(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 182
LDI r2, 74
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (166, 211) and radius 11.
; PLAN: r0=166(x), r1=211(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 211
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
