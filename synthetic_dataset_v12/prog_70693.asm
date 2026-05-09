; DESCRIPTION: Renders a orange line between points (392, 238) and (130, 80).
; PLAN: r0=392(x1), r1=238(y1), r2=130(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 238
LDI r2, 130
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
