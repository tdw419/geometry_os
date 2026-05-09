; DESCRIPTION: Renders a white line between points (65, 223) and (325, 123).
; PLAN: r0=65(x1), r1=223(y1), r2=325(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 223
LDI r2, 325
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
