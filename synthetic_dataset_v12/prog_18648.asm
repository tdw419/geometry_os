; DESCRIPTION: Renders a white line between points (285, 110) and (275, 147).
; PLAN: r0=285(x1), r1=110(y1), r2=275(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 110
LDI r2, 275
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
