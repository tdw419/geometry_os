; DESCRIPTION: Renders a magenta line between points (229, 214) and (125, 104).
; PLAN: r0=229(x1), r1=214(y1), r2=125(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 214
LDI r2, 125
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
