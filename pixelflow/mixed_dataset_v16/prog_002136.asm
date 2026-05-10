; DESCRIPTION: Renders a magenta line between points (323, 195) and (399, 193).
; PLAN: r0=323(x1), r1=195(y1), r2=399(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 195
LDI r2, 399
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
