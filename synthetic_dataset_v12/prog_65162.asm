; DESCRIPTION: Renders a blue line between points (66, 172) and (176, 91).
; PLAN: r0=66(x1), r1=172(y1), r2=176(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 172
LDI r2, 176
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
