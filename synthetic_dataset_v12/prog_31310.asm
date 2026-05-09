; DESCRIPTION: Renders a magenta line between points (58, 15) and (470, 230).
; PLAN: r0=58(x1), r1=15(y1), r2=470(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 15
LDI r2, 470
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
