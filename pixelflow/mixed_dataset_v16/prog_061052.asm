; DESCRIPTION: Renders a white line between points (285, 211) and (312, 153).
; PLAN: r0=285(x1), r1=211(y1), r2=312(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 211
LDI r2, 312
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
