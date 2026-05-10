; DESCRIPTION: Renders a magenta line between points (427, 159) and (107, 233).
; PLAN: r0=427(x1), r1=159(y1), r2=107(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 159
LDI r2, 107
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
