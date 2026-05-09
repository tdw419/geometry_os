; DESCRIPTION: Renders a blue line between points (249, 168) and (63, 137).
; PLAN: r0=249(x1), r1=168(y1), r2=63(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 168
LDI r2, 63
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
