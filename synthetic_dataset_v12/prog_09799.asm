; DESCRIPTION: Renders a magenta line between points (377, 149) and (79, 241).
; PLAN: r0=377(x1), r1=149(y1), r2=79(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 149
LDI r2, 79
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
