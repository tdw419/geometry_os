; DESCRIPTION: Renders a white line between points (31, 44) and (20, 247).
; PLAN: r0=31(x1), r1=44(y1), r2=20(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 44
LDI r2, 20
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
