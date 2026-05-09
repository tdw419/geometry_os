; DESCRIPTION: Renders a magenta line between points (381, 51) and (30, 184).
; PLAN: r0=381(x1), r1=51(y1), r2=30(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 51
LDI r2, 30
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
