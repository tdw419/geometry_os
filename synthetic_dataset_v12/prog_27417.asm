; DESCRIPTION: Renders a blue line between points (432, 241) and (460, 181).
; PLAN: r0=432(x1), r1=241(y1), r2=460(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 241
LDI r2, 460
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
