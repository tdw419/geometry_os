; DESCRIPTION: Renders a magenta line between points (128, 114) and (51, 218).
; PLAN: r0=128(x1), r1=114(y1), r2=51(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 114
LDI r2, 51
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
