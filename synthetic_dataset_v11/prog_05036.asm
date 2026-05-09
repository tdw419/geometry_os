; DESCRIPTION: Renders a orange line between points (70, 147) and (87, 141).
; PLAN: r0=70(x1), r1=147(y1), r2=87(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 147
LDI r2, 87
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
