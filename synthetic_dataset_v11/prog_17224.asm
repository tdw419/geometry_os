; DESCRIPTION: Renders a magenta line between points (105, 34) and (220, 52).
; PLAN: r0=105(x1), r1=34(y1), r2=220(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 34
LDI r2, 220
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
