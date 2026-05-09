; DESCRIPTION: Renders a white line between points (468, 40) and (36, 1).
; PLAN: r0=468(x1), r1=40(y1), r2=36(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 40
LDI r2, 36
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
