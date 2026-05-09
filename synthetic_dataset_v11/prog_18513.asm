; DESCRIPTION: Places a red line segment connecting (20, 112) to (245, 208).
; PLAN: r0=20(x1), r1=112(y1), r2=245(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 112
LDI r2, 245
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
