; DESCRIPTION: Renders a white line between points (77, 154) and (315, 33).
; PLAN: r0=77(x1), r1=154(y1), r2=315(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 154
LDI r2, 315
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
