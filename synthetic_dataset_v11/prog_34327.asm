; DESCRIPTION: Composite: . Then Renders a orange line between points (131, 128) and (204, 217). Then Renders a black disk with center (236, 190) and radius 17.
; PLAN: r0=131(x1), r1=128(y1), r2=204(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=236(x), r1=190(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange line between points (131, 128) and (204, 217).
; PLAN: r0=131(x1), r1=128(y1), r2=204(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 128
LDI r2, 204
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (236, 190) and radius 17.
; PLAN: r0=236(x), r1=190(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 190
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
