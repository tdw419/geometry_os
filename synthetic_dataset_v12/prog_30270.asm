; DESCRIPTION: Renders a yellow line between points (408, 195) and (258, 145).
; PLAN: r0=408(x1), r1=195(y1), r2=258(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 195
LDI r2, 258
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
