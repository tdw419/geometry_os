; DESCRIPTION: Places a red line segment connecting (503, 181) to (160, 12).
; PLAN: r0=503(x1), r1=181(y1), r2=160(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 181
LDI r2, 160
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
