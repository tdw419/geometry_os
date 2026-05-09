; DESCRIPTION: Renders a blue line between points (408, 144) and (95, 248).
; PLAN: r0=408(x1), r1=144(y1), r2=95(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 144
LDI r2, 95
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
