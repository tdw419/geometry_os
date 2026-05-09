; DESCRIPTION: Renders a white line between points (273, 211) and (465, 148).
; PLAN: r0=273(x1), r1=211(y1), r2=465(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 211
LDI r2, 465
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
