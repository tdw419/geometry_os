; DESCRIPTION: Renders a magenta line between points (449, 58) and (273, 211).
; PLAN: r0=449(x1), r1=58(y1), r2=273(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 58
LDI r2, 273
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
