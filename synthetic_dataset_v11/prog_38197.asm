; DESCRIPTION: Renders a orange line between points (135, 140) and (193, 16).
; PLAN: r0=135(x1), r1=140(y1), r2=193(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 140
LDI r2, 193
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
