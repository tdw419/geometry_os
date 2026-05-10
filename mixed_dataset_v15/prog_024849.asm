; DESCRIPTION: Renders a green line between points (260, 160) and (385, 227).
; PLAN: r0=260(x1), r1=160(y1), r2=385(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 160
LDI r2, 385
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
