; DESCRIPTION: Renders a magenta line between points (55, 220) and (223, 34).
; PLAN: r0=55(x1), r1=220(y1), r2=223(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 220
LDI r2, 223
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
