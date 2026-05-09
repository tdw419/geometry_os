; DESCRIPTION: Renders a magenta line between points (86, 65) and (211, 207).
; PLAN: r0=86(x1), r1=65(y1), r2=211(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 65
LDI r2, 211
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
