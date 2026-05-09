; DESCRIPTION: Composite: Renders a green line between points (363, 121) and (454, 87) then Renders a red disk with center (84, 64) and radius 24.
; PLAN: r0=363(x1), r1=121(y1), r2=454(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=64(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 121
LDI r2, 454
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 64
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
