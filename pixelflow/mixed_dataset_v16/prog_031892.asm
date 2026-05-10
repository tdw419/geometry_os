; DESCRIPTION: Renders a orange line between points (38, 152) and (505, 169).
; PLAN: r0=38(x1), r1=152(y1), r2=505(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 152
LDI r2, 505
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
