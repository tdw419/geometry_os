; DESCRIPTION: Renders a white line between points (7, 57) and (131, 18).
; PLAN: r0=7(x1), r1=57(y1), r2=131(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 57
LDI r2, 131
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
