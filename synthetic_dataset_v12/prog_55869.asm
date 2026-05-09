; DESCRIPTION: Renders a white line between points (483, 223) and (400, 177).
; PLAN: r0=483(x1), r1=223(y1), r2=400(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 223
LDI r2, 400
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
