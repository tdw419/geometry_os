; DESCRIPTION: Renders a black line between points (503, 229) and (316, 131).
; PLAN: r0=503(x1), r1=229(y1), r2=316(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 229
LDI r2, 316
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
