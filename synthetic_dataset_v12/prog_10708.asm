; DESCRIPTION: Renders a blue line between points (418, 56) and (209, 194).
; PLAN: r0=418(x1), r1=56(y1), r2=209(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 56
LDI r2, 209
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
