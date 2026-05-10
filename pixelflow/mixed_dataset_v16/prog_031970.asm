; DESCRIPTION: Renders a magenta line between points (439, 56) and (104, 217).
; PLAN: r0=439(x1), r1=56(y1), r2=104(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 56
LDI r2, 104
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
