; DESCRIPTION: Renders a magenta line between points (441, 204) and (261, 162).
; PLAN: r0=441(x1), r1=204(y1), r2=261(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 204
LDI r2, 261
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
