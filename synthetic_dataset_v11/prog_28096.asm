; DESCRIPTION: Renders a red line between points (63, 13) and (74, 112).
; PLAN: r0=63(x1), r1=13(y1), r2=74(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 13
LDI r2, 74
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
