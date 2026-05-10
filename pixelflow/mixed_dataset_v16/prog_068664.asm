; DESCRIPTION: Renders a orange line between points (193, 48) and (84, 221).
; PLAN: r0=193(x1), r1=48(y1), r2=84(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 48
LDI r2, 84
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
