; DESCRIPTION: Draws a magenta line from (439, 47) to (136, 200).
; PLAN: r0=439(x1), r1=47(y1), r2=136(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 47
LDI r2, 136
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
