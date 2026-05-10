; DESCRIPTION: Renders a white line between points (458, 97) and (313, 47).
; PLAN: r0=458(x1), r1=97(y1), r2=313(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 97
LDI r2, 313
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
