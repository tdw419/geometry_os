; DESCRIPTION: Renders a orange line between points (80, 193) and (21, 108).
; PLAN: r0=80(x1), r1=193(y1), r2=21(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 193
LDI r2, 21
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
