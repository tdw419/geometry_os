; DESCRIPTION: Renders a green line between points (100, 3) and (418, 163).
; PLAN: r0=100(x1), r1=3(y1), r2=418(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 3
LDI r2, 418
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
