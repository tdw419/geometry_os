; DESCRIPTION: Places a red line segment connecting (503, 86) to (503, 21).
; PLAN: r0=503(x1), r1=86(y1), r2=503(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 86
LDI r2, 503
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
