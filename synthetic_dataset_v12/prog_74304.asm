; DESCRIPTION: Composite: Places a red line segment connecting (301, 163) to (364, 246) then Renders a purple disk with center (345, 108) and radius 76.
; PLAN: r0=301(x1), r1=163(y1), r2=364(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=108(y), r7=76(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 163
LDI r2, 364
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 108
LDI r7, 76
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
