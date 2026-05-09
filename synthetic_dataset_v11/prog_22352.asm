; DESCRIPTION: Renders a yellow line between points (141, 195) and (77, 8).
; PLAN: r0=141(x1), r1=195(y1), r2=77(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 195
LDI r2, 77
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
