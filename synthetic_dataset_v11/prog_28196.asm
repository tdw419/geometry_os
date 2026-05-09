; DESCRIPTION: Renders a black line between points (221, 194) and (99, 81).
; PLAN: r0=221(x1), r1=194(y1), r2=99(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 194
LDI r2, 99
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
