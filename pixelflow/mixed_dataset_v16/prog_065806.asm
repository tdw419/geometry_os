; DESCRIPTION: Renders a white line between points (250, 218) and (132, 232).
; PLAN: r0=250(x1), r1=218(y1), r2=132(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 218
LDI r2, 132
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
