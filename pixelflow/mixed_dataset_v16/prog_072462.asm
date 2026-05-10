; DESCRIPTION: Renders a magenta line between points (208, 58) and (366, 158).
; PLAN: r0=208(x1), r1=58(y1), r2=366(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 58
LDI r2, 366
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
