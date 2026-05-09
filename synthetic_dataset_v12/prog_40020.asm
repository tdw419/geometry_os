; DESCRIPTION: Renders a white line between points (263, 119) and (193, 161).
; PLAN: r0=263(x1), r1=119(y1), r2=193(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 119
LDI r2, 193
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
