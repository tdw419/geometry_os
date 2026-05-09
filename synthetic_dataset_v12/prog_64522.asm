; DESCRIPTION: Composite: Renders a green line between points (489, 192) and (89, 85) then Renders a magenta disk with center (356, 82) and radius 34.
; PLAN: r0=489(x1), r1=192(y1), r2=89(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=82(y), r7=34(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 489
LDI r1, 192
LDI r2, 89
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 82
LDI r7, 34
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
