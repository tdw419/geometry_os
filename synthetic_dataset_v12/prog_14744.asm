; DESCRIPTION: Renders a magenta line between points (353, 223) and (332, 251).
; PLAN: r0=353(x1), r1=223(y1), r2=332(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 223
LDI r2, 332
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
