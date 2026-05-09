; DESCRIPTION: Renders a blue line between points (26, 226) and (66, 36).
; PLAN: r0=26(x1), r1=226(y1), r2=66(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 226
LDI r2, 66
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
