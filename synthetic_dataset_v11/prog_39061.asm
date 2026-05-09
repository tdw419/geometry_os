; DESCRIPTION: Renders a magenta line between points (146, 193) and (181, 129).
; PLAN: r0=146(x1), r1=193(y1), r2=181(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 193
LDI r2, 181
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
