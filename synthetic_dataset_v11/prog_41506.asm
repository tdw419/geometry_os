; DESCRIPTION: Renders a magenta line between points (23, 214) and (172, 79).
; PLAN: r0=23(x1), r1=214(y1), r2=172(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 214
LDI r2, 172
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
