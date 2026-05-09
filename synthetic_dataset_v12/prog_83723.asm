; DESCRIPTION: Draws a magenta line from (21, 254) to (85, 72).
; PLAN: r0=21(x1), r1=254(y1), r2=85(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 254
LDI r2, 85
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
