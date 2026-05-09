; DESCRIPTION: Renders a black line between points (468, 90) and (321, 214).
; PLAN: r0=468(x1), r1=90(y1), r2=321(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 90
LDI r2, 321
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
