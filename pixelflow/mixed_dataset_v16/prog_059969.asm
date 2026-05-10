; DESCRIPTION: Renders a yellow line between points (408, 23) and (503, 141).
; PLAN: r0=408(x1), r1=23(y1), r2=503(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 23
LDI r2, 503
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
