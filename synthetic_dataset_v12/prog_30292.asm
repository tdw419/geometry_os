; DESCRIPTION: Composite: Renders a magenta disk with center (189, 85) and radius 39 then Renders a red line between points (237, 145) and (326, 15).
; PLAN: r0=189(x), r1=85(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x1), r6=145(y1), r7=326(x2), r8=15(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 85
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 145
LDI r7, 326
LDI r8, 15
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
