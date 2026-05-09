; DESCRIPTION: Composite: . Then Renders a purple line between points (93, 245) and (174, 37). Then Creates a cyan circular shape at (97, 17) with radius 17.
; PLAN: r0=93(x1), r1=245(y1), r2=174(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=17(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (93, 245) and (174, 37).
; PLAN: r0=93(x1), r1=245(y1), r2=174(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 245
LDI r2, 174
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (97, 17) with radius 17.
; PLAN: r0=97(x), r1=17(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 17
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
