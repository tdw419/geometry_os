; DESCRIPTION: Places a red line segment connecting (208, 14) to (204, 132).
; PLAN: r0=208(x1), r1=14(y1), r2=204(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 14
LDI r2, 204
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
