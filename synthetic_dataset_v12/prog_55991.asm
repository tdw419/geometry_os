; DESCRIPTION: Renders a white line between points (465, 15) and (273, 169).
; PLAN: r0=465(x1), r1=15(y1), r2=273(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 15
LDI r2, 273
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
