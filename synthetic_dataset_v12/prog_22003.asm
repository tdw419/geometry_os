; DESCRIPTION: Renders a magenta line between points (457, 121) and (392, 230).
; PLAN: r0=457(x1), r1=121(y1), r2=392(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 121
LDI r2, 392
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
