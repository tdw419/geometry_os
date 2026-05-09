; DESCRIPTION: Renders a yellow line between points (13, 237) and (317, 81).
; PLAN: r0=13(x1), r1=237(y1), r2=317(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 237
LDI r2, 317
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
