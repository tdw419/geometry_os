; DESCRIPTION: Renders a yellow line between points (354, 190) and (17, 217).
; PLAN: r0=354(x1), r1=190(y1), r2=17(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 190
LDI r2, 17
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
