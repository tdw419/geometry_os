; DESCRIPTION: Renders a white line between points (193, 179) and (43, 76).
; PLAN: r0=193(x1), r1=179(y1), r2=43(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 179
LDI r2, 43
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
