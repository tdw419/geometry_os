; DESCRIPTION: Renders a white line between points (147, 233) and (365, 28).
; PLAN: r0=147(x1), r1=233(y1), r2=365(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 233
LDI r2, 365
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
