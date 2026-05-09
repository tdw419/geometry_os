; DESCRIPTION: Composite: Renders a purple line between points (82, 231) and (410, 190) then Creates a green circular shape at (279, 62) with radius 56.
; PLAN: r0=82(x1), r1=231(y1), r2=410(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=62(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 82
LDI r1, 231
LDI r2, 410
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 62
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
