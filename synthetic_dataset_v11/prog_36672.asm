; DESCRIPTION: Places a orange line segment connecting (188, 204) to (95, 152).
; PLAN: r0=188(x1), r1=204(y1), r2=95(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 204
LDI r2, 95
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
