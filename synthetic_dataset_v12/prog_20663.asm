; DESCRIPTION: Renders a white line between points (125, 47) and (303, 102).
; PLAN: r0=125(x1), r1=47(y1), r2=303(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 47
LDI r2, 303
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
