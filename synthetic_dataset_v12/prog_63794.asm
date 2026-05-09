; DESCRIPTION: Renders a magenta line between points (188, 134) and (510, 14).
; PLAN: r0=188(x1), r1=134(y1), r2=510(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 134
LDI r2, 510
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
