; DESCRIPTION: Renders a white line between points (129, 190) and (1, 132).
; PLAN: r0=129(x1), r1=190(y1), r2=1(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 190
LDI r2, 1
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
