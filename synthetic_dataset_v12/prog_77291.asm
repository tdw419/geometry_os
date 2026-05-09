; DESCRIPTION: Renders a magenta line between points (378, 180) and (456, 51).
; PLAN: r0=378(x1), r1=180(y1), r2=456(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 180
LDI r2, 456
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
