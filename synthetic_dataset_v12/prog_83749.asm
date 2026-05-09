; DESCRIPTION: Renders a white line between points (233, 48) and (195, 149).
; PLAN: r0=233(x1), r1=48(y1), r2=195(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 48
LDI r2, 195
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
