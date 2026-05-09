; DESCRIPTION: Renders a magenta line between points (361, 145) and (104, 63).
; PLAN: r0=361(x1), r1=145(y1), r2=104(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 145
LDI r2, 104
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
