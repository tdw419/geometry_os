; DESCRIPTION: Composite: . Then Draws a purple line from (65, 100) to (195, 114). Then Renders a red disk with center (98, 83) and radius 65.
; PLAN: r0=65(x1), r1=100(y1), r2=195(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=98(x), r1=83(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (65, 100) to (195, 114).
; PLAN: r0=65(x1), r1=100(y1), r2=195(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 100
LDI r2, 195
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (98, 83) and radius 65.
; PLAN: r0=98(x), r1=83(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 83
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
