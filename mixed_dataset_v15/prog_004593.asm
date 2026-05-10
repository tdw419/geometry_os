; DESCRIPTION: Renders a orange line between points (408, 12) and (132, 33).
; PLAN: r0=408(x1), r1=12(y1), r2=132(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 12
LDI r2, 132
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
