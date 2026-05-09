; DESCRIPTION: Renders a white line between points (44, 183) and (428, 223).
; PLAN: r0=44(x1), r1=183(y1), r2=428(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 183
LDI r2, 428
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
