; DESCRIPTION: Renders a magenta line between points (8, 217) and (332, 192).
; PLAN: r0=8(x1), r1=217(y1), r2=332(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 217
LDI r2, 332
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
