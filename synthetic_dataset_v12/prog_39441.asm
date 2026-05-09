; DESCRIPTION: Renders a magenta line between points (59, 241) and (112, 221).
; PLAN: r0=59(x1), r1=241(y1), r2=112(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 241
LDI r2, 112
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
