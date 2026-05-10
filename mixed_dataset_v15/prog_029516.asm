; DESCRIPTION: Renders a orange line between points (137, 21) and (237, 141).
; PLAN: r0=137(x1), r1=21(y1), r2=237(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 21
LDI r2, 237
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
