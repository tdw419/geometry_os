; DESCRIPTION: Renders a white line between points (106, 146) and (416, 71).
; PLAN: r0=106(x1), r1=146(y1), r2=416(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 146
LDI r2, 416
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
