; DESCRIPTION: Renders a blue line between points (222, 95) and (308, 91).
; PLAN: r0=222(x1), r1=95(y1), r2=308(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 95
LDI r2, 308
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
