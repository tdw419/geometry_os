; DESCRIPTION: Renders a magenta line between points (204, 194) and (146, 206).
; PLAN: r0=204(x1), r1=194(y1), r2=146(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 194
LDI r2, 146
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
