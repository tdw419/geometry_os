; DESCRIPTION: Renders a magenta line between points (189, 59) and (448, 33).
; PLAN: r0=189(x1), r1=59(y1), r2=448(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 59
LDI r2, 448
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
