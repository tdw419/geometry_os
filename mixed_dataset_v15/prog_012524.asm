; DESCRIPTION: Renders a red line between points (447, 103) and (321, 144).
; PLAN: r0=447(x1), r1=103(y1), r2=321(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 103
LDI r2, 321
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
