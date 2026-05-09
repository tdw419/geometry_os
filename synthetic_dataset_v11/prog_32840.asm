; DESCRIPTION: Renders a magenta line between points (85, 72) and (72, 63).
; PLAN: r0=85(x1), r1=72(y1), r2=72(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 72
LDI r2, 72
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
