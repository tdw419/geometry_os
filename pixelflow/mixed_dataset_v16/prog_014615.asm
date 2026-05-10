; DESCRIPTION: Renders a magenta line between points (277, 190) and (273, 160).
; PLAN: r0=277(x1), r1=190(y1), r2=273(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 190
LDI r2, 273
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
