; DESCRIPTION: Renders a black line between points (238, 188) and (449, 223).
; PLAN: r0=238(x1), r1=188(y1), r2=449(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 188
LDI r2, 449
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
