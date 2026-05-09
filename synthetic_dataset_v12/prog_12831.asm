; DESCRIPTION: Renders a green line between points (378, 193) and (36, 192).
; PLAN: r0=378(x1), r1=193(y1), r2=36(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 193
LDI r2, 36
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
