; DESCRIPTION: Renders a magenta line between points (26, 180) and (363, 39).
; PLAN: r0=26(x1), r1=180(y1), r2=363(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 180
LDI r2, 363
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
