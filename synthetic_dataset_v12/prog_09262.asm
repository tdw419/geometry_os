; DESCRIPTION: Renders a black line between points (337, 186) and (441, 75).
; PLAN: r0=337(x1), r1=186(y1), r2=441(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 186
LDI r2, 441
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
