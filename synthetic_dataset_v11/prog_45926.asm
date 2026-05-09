; DESCRIPTION: Renders a magenta line between points (204, 54) and (81, 73).
; PLAN: r0=204(x1), r1=54(y1), r2=81(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 54
LDI r2, 81
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
