; DESCRIPTION: Renders a yellow line between points (50, 25) and (73, 112).
; PLAN: r0=50(x1), r1=25(y1), r2=73(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 25
LDI r2, 73
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
