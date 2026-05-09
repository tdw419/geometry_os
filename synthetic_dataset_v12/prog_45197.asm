; DESCRIPTION: Places a red line segment connecting (245, 50) to (54, 155).
; PLAN: r0=245(x1), r1=50(y1), r2=54(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 50
LDI r2, 54
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
