; DESCRIPTION: Renders a blue line between points (434, 24) and (147, 37).
; PLAN: r0=434(x1), r1=24(y1), r2=147(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 24
LDI r2, 147
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
