; DESCRIPTION: Renders a magenta line between points (85, 148) and (444, 214).
; PLAN: r0=85(x1), r1=148(y1), r2=444(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 148
LDI r2, 444
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
