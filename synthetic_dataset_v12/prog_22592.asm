; DESCRIPTION: Renders a blue line between points (208, 48) and (433, 245).
; PLAN: r0=208(x1), r1=48(y1), r2=433(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 48
LDI r2, 433
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
