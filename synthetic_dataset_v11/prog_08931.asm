; DESCRIPTION: Composite: . Then Places a purple line segment connecting (127, 242) to (185, 157). Then Creates a black circular shape at (163, 190) with radius 62.
; PLAN: r0=127(x1), r1=242(y1), r2=185(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=163(x), r1=190(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (127, 242) to (185, 157).
; PLAN: r0=127(x1), r1=242(y1), r2=185(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 242
LDI r2, 185
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (163, 190) with radius 62.
; PLAN: r0=163(x), r1=190(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 190
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
