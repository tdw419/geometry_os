; DESCRIPTION: Renders a yellow line between points (125, 13) and (317, 230).
; PLAN: r0=125(x1), r1=13(y1), r2=317(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 13
LDI r2, 317
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
