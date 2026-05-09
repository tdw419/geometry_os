; DESCRIPTION: Renders a black line between points (50, 65) and (201, 192).
; PLAN: r0=50(x1), r1=65(y1), r2=201(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 65
LDI r2, 201
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
