; DESCRIPTION: Renders a yellow line between points (436, 223) and (466, 181).
; PLAN: r0=436(x1), r1=223(y1), r2=466(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 223
LDI r2, 466
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
