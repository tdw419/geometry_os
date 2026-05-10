; DESCRIPTION: Renders a black line between points (326, 211) and (186, 131).
; PLAN: r0=326(x1), r1=211(y1), r2=186(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 211
LDI r2, 186
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
