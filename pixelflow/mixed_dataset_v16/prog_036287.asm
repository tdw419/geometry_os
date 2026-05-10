; DESCRIPTION: Places a red line segment connecting (499, 227) to (186, 152).
; PLAN: r0=499(x1), r1=227(y1), r2=186(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 227
LDI r2, 186
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
