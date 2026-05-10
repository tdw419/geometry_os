; DESCRIPTION: Renders a magenta line between points (143, 33) and (331, 221).
; PLAN: r0=143(x1), r1=33(y1), r2=331(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 33
LDI r2, 331
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
