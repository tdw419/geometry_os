; DESCRIPTION: Draws a yellow line from (109, 63) to (110, 141).
; PLAN: r0=109(x1), r1=63(y1), r2=110(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 63
LDI r2, 110
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
