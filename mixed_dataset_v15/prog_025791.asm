; DESCRIPTION: Renders a magenta line between points (31, 252) and (77, 248).
; PLAN: r0=31(x1), r1=252(y1), r2=77(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 252
LDI r2, 77
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
