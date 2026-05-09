; DESCRIPTION: Renders a magenta line between points (143, 241) and (86, 227).
; PLAN: r0=143(x1), r1=241(y1), r2=86(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 241
LDI r2, 86
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
