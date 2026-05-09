; DESCRIPTION: Renders a yellow line between points (443, 115) and (221, 178).
; PLAN: r0=443(x1), r1=115(y1), r2=221(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 115
LDI r2, 221
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
