; DESCRIPTION: Renders a yellow line between points (447, 233) and (356, 82).
; PLAN: r0=447(x1), r1=233(y1), r2=356(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 233
LDI r2, 356
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
