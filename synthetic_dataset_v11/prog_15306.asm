; DESCRIPTION: Places a red line segment connecting (245, 79) to (112, 60).
; PLAN: r0=245(x1), r1=79(y1), r2=112(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 79
LDI r2, 112
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
