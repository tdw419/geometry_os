; DESCRIPTION: Renders a magenta line between points (50, 89) and (43, 29).
; PLAN: r0=50(x1), r1=89(y1), r2=43(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 89
LDI r2, 43
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
