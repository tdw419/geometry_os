; DESCRIPTION: Places a white line segment connecting (404, 145) to (431, 73).
; PLAN: r0=404(x1), r1=145(y1), r2=431(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 145
LDI r2, 431
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
