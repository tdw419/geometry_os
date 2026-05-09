; DESCRIPTION: Renders a black line between points (147, 168) and (240, 225).
; PLAN: r0=147(x1), r1=168(y1), r2=240(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 168
LDI r2, 240
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
