; DESCRIPTION: Composite: Places a purple dot at position (459, 84) then Renders a yellow line between points (399, 200) and (297, 63).
; PLAN: r0=459(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=399(x1), r6=200(y1), r7=297(x2), r8=63(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 84
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 200
LDI r7, 297
LDI r8, 63
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
