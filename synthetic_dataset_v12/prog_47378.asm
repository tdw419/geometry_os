; DESCRIPTION: Renders a magenta line between points (91, 36) and (248, 94).
; PLAN: r0=91(x1), r1=36(y1), r2=248(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 36
LDI r2, 248
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
