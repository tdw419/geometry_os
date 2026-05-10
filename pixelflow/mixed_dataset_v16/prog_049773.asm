; DESCRIPTION: Places a orange line segment connecting (503, 113) to (195, 82).
; PLAN: r0=503(x1), r1=113(y1), r2=195(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 113
LDI r2, 195
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
