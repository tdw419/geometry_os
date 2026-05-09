; DESCRIPTION: Renders a white line between points (461, 70) and (303, 243).
; PLAN: r0=461(x1), r1=70(y1), r2=303(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 70
LDI r2, 303
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
