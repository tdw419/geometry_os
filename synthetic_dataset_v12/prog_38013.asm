; DESCRIPTION: Renders a white line between points (131, 223) and (106, 136).
; PLAN: r0=131(x1), r1=223(y1), r2=106(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 223
LDI r2, 106
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
