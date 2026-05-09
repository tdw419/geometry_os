; DESCRIPTION: Renders a white line between points (89, 25) and (48, 82).
; PLAN: r0=89(x1), r1=25(y1), r2=48(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 25
LDI r2, 48
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
