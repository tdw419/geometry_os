; DESCRIPTION: Renders a red line between points (463, 229) and (289, 44).
; PLAN: r0=463(x1), r1=229(y1), r2=289(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 229
LDI r2, 289
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
