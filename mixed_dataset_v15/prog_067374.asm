; DESCRIPTION: Composite: Creates a purple circular shape at (127, 181) with radius 64 then Renders a yellow line between points (443, 58) and (2, 75).
; PLAN: r0=127(x), r1=181(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x1), r6=58(y1), r7=2(x2), r8=75(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 181
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 58
LDI r7, 2
LDI r8, 75
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
