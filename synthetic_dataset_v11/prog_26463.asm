; DESCRIPTION: Renders a yellow line between points (50, 133) and (26, 229).
; PLAN: r0=50(x1), r1=133(y1), r2=26(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 133
LDI r2, 26
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
