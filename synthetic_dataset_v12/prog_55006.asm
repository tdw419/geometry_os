; DESCRIPTION: Renders a magenta line between points (331, 77) and (256, 44).
; PLAN: r0=331(x1), r1=77(y1), r2=256(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 77
LDI r2, 256
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
