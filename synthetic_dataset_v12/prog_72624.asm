; DESCRIPTION: Renders a orange line between points (411, 127) and (124, 24).
; PLAN: r0=411(x1), r1=127(y1), r2=124(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 127
LDI r2, 124
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
