; DESCRIPTION: Renders a yellow line between points (323, 195) and (72, 133).
; PLAN: r0=323(x1), r1=195(y1), r2=72(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 195
LDI r2, 72
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
