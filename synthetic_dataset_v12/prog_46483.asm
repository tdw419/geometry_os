; DESCRIPTION: Renders a white line between points (258, 73) and (3, 169).
; PLAN: r0=258(x1), r1=73(y1), r2=3(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 73
LDI r2, 3
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
