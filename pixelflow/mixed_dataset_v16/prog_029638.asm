; DESCRIPTION: Renders a blue line between points (355, 164) and (229, 182).
; PLAN: r0=355(x1), r1=164(y1), r2=229(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 164
LDI r2, 229
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
