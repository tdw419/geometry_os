; DESCRIPTION: Renders a green line between points (449, 174) and (315, 48).
; PLAN: r0=449(x1), r1=174(y1), r2=315(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 174
LDI r2, 315
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
