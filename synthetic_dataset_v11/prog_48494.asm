; DESCRIPTION: Renders a blue line between points (241, 50) and (145, 150).
; PLAN: r0=241(x1), r1=50(y1), r2=145(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 50
LDI r2, 145
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
