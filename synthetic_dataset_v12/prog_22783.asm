; DESCRIPTION: Renders a magenta line between points (87, 184) and (204, 196).
; PLAN: r0=87(x1), r1=184(y1), r2=204(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 184
LDI r2, 204
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
