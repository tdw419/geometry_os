; DESCRIPTION: Renders a yellow line between points (193, 241) and (345, 20).
; PLAN: r0=193(x1), r1=241(y1), r2=345(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 241
LDI r2, 345
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
