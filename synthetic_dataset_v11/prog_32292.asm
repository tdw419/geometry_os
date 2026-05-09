; DESCRIPTION: Renders a magenta line between points (13, 164) and (87, 147).
; PLAN: r0=13(x1), r1=164(y1), r2=87(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 164
LDI r2, 87
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
