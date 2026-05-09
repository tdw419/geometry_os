; DESCRIPTION: Renders a blue line between points (325, 137) and (74, 16).
; PLAN: r0=325(x1), r1=137(y1), r2=74(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 137
LDI r2, 74
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
