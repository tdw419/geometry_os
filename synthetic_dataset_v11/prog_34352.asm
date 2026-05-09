; DESCRIPTION: Renders a magenta line between points (117, 191) and (36, 233).
; PLAN: r0=117(x1), r1=191(y1), r2=36(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 191
LDI r2, 36
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
