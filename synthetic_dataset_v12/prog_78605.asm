; DESCRIPTION: Renders a black line between points (355, 214) and (220, 133).
; PLAN: r0=355(x1), r1=214(y1), r2=220(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 214
LDI r2, 220
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
