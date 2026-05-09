; DESCRIPTION: Renders a yellow line between points (382, 100) and (195, 120).
; PLAN: r0=382(x1), r1=100(y1), r2=195(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 100
LDI r2, 195
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
