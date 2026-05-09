; DESCRIPTION: Renders a red line between points (377, 147) and (480, 144).
; PLAN: r0=377(x1), r1=147(y1), r2=480(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 147
LDI r2, 480
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
