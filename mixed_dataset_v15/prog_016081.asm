; DESCRIPTION: Renders a magenta line between points (199, 61) and (277, 43).
; PLAN: r0=199(x1), r1=61(y1), r2=277(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 61
LDI r2, 277
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
