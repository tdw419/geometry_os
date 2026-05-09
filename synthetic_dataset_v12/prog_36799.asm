; DESCRIPTION: Renders a white line between points (271, 169) and (7, 3).
; PLAN: r0=271(x1), r1=169(y1), r2=7(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 169
LDI r2, 7
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
