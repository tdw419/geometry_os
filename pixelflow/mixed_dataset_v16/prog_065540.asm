; DESCRIPTION: Renders a blue line between points (484, 241) and (418, 242).
; PLAN: r0=484(x1), r1=241(y1), r2=418(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 241
LDI r2, 418
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
