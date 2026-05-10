; DESCRIPTION: Renders a green line between points (303, 57) and (325, 189).
; PLAN: r0=303(x1), r1=57(y1), r2=325(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 57
LDI r2, 325
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
