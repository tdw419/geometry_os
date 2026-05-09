; DESCRIPTION: Renders a yellow line between points (321, 179) and (208, 172).
; PLAN: r0=321(x1), r1=179(y1), r2=208(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 179
LDI r2, 208
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
