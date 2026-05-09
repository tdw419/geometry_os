; DESCRIPTION: Renders a black line between points (418, 196) and (195, 160).
; PLAN: r0=418(x1), r1=196(y1), r2=195(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 196
LDI r2, 195
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
