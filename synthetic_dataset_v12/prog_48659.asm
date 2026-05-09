; DESCRIPTION: Renders a magenta line between points (248, 151) and (97, 170).
; PLAN: r0=248(x1), r1=151(y1), r2=97(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 151
LDI r2, 97
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
