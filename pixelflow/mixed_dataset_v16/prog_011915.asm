; DESCRIPTION: Renders a yellow line between points (382, 163) and (90, 60).
; PLAN: r0=382(x1), r1=163(y1), r2=90(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 163
LDI r2, 90
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
