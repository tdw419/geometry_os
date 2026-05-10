; DESCRIPTION: Renders a magenta line between points (94, 203) and (31, 117).
; PLAN: r0=94(x1), r1=203(y1), r2=31(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 203
LDI r2, 31
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
