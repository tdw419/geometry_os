; DESCRIPTION: Renders a purple line between points (0, 99) and (218, 117).
; PLAN: r0=0(x1), r1=99(y1), r2=218(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 99
LDI r2, 218
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
