; DESCRIPTION: Draws a magenta line from (192, 109) to (318, 117).
; PLAN: r0=192(x1), r1=109(y1), r2=318(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 109
LDI r2, 318
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
