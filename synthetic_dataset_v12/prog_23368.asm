; DESCRIPTION: Renders a blue line between points (242, 79) and (186, 80).
; PLAN: r0=242(x1), r1=79(y1), r2=186(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 79
LDI r2, 186
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
