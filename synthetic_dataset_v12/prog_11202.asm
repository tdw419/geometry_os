; DESCRIPTION: Renders a white line between points (450, 89) and (309, 226).
; PLAN: r0=450(x1), r1=89(y1), r2=309(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 89
LDI r2, 309
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
