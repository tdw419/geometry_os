; DESCRIPTION: Renders a yellow line between points (328, 148) and (331, 214).
; PLAN: r0=328(x1), r1=148(y1), r2=331(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 148
LDI r2, 331
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
