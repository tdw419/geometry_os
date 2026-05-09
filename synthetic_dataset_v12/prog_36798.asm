; DESCRIPTION: Renders a magenta line between points (248, 104) and (199, 208).
; PLAN: r0=248(x1), r1=104(y1), r2=199(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 104
LDI r2, 199
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
