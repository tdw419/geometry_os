; DESCRIPTION: Renders a magenta line between points (219, 136) and (167, 138).
; PLAN: r0=219(x1), r1=136(y1), r2=167(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 136
LDI r2, 167
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
