; DESCRIPTION: Renders a orange line between points (273, 208) and (63, 32).
; PLAN: r0=273(x1), r1=208(y1), r2=63(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 208
LDI r2, 63
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
