; DESCRIPTION: Renders a green line between points (161, 115) and (251, 223).
; PLAN: r0=161(x1), r1=115(y1), r2=251(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 115
LDI r2, 251
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
