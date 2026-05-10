; DESCRIPTION: Composite: Places a purple circle of radius 53 at center (278, 194) then Renders a cyan line between points (249, 60) and (314, 79).
; PLAN: r0=278(x), r1=194(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x1), r6=60(y1), r7=314(x2), r8=79(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 194
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 60
LDI r7, 314
LDI r8, 79
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
