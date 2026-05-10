; DESCRIPTION: Renders a white line between points (471, 191) and (145, 70).
; PLAN: r0=471(x1), r1=191(y1), r2=145(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 191
LDI r2, 145
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
