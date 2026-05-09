; DESCRIPTION: Composite: . Then Renders a black disk with center (195, 90) and radius 49. Then Draws a yellow line from (145, 74) to (225, 195).
; PLAN: r0=195(x), r1=90(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=145(x1), r1=74(y1), r2=225(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (195, 90) and radius 49.
; PLAN: r0=195(x), r1=90(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 90
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (145, 74) to (225, 195).
; PLAN: r0=145(x1), r1=74(y1), r2=225(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 74
LDI r2, 225
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
