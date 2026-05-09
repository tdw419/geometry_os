; DESCRIPTION: Renders a white line between points (277, 188) and (427, 234).
; PLAN: r0=277(x1), r1=188(y1), r2=427(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 188
LDI r2, 427
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
