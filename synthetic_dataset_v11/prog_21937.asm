; DESCRIPTION: Renders a white line between points (44, 177) and (250, 47).
; PLAN: r0=44(x1), r1=177(y1), r2=250(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 177
LDI r2, 250
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
