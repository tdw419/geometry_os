; DESCRIPTION: Renders a magenta line between points (22, 167) and (225, 58).
; PLAN: r0=22(x1), r1=167(y1), r2=225(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 167
LDI r2, 225
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
