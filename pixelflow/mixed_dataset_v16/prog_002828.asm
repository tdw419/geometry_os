; DESCRIPTION: Renders a white line between points (379, 220) and (393, 81).
; PLAN: r0=379(x1), r1=220(y1), r2=393(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 220
LDI r2, 393
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
