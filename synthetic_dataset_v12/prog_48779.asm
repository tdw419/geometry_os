; DESCRIPTION: Renders a green line between points (11, 115) and (146, 169).
; PLAN: r0=11(x1), r1=115(y1), r2=146(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 115
LDI r2, 146
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
