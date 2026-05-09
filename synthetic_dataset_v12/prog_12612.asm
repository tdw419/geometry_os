; DESCRIPTION: Renders a magenta line between points (72, 87) and (491, 45).
; PLAN: r0=72(x1), r1=87(y1), r2=491(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 87
LDI r2, 491
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
