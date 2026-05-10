; DESCRIPTION: Renders a magenta line between points (26, 51) and (62, 195).
; PLAN: r0=26(x1), r1=51(y1), r2=62(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 51
LDI r2, 62
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
