; DESCRIPTION: Renders a magenta line between points (22, 126) and (132, 197).
; PLAN: r0=22(x1), r1=126(y1), r2=132(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 126
LDI r2, 132
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
