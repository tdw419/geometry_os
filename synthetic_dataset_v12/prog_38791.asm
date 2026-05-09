; DESCRIPTION: Renders a magenta line between points (260, 125) and (252, 114).
; PLAN: r0=260(x1), r1=125(y1), r2=252(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 125
LDI r2, 252
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
