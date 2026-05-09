; DESCRIPTION: Renders a yellow line between points (503, 6) and (179, 117).
; PLAN: r0=503(x1), r1=6(y1), r2=179(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 6
LDI r2, 179
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
