; DESCRIPTION: Renders a yellow line between points (471, 6) and (498, 111).
; PLAN: r0=471(x1), r1=6(y1), r2=498(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 6
LDI r2, 498
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
