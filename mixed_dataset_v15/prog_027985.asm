; DESCRIPTION: Renders a yellow line between points (147, 33) and (405, 140).
; PLAN: r0=147(x1), r1=33(y1), r2=405(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 33
LDI r2, 405
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
