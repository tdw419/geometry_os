; DESCRIPTION: Renders a magenta line between points (91, 181) and (376, 50).
; PLAN: r0=91(x1), r1=181(y1), r2=376(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 181
LDI r2, 376
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
