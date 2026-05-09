; DESCRIPTION: Renders a yellow line between points (418, 78) and (354, 139).
; PLAN: r0=418(x1), r1=78(y1), r2=354(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 78
LDI r2, 354
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
