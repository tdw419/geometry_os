; DESCRIPTION: Renders a orange line between points (127, 80) and (260, 4).
; PLAN: r0=127(x1), r1=80(y1), r2=260(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 80
LDI r2, 260
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
