; DESCRIPTION: Renders a blue line between points (482, 218) and (24, 241).
; PLAN: r0=482(x1), r1=218(y1), r2=24(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 218
LDI r2, 24
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
