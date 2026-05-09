; DESCRIPTION: Renders a orange line between points (23, 106) and (307, 145).
; PLAN: r0=23(x1), r1=106(y1), r2=307(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 106
LDI r2, 307
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
