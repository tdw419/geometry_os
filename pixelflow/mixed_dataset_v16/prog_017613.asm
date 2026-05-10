; DESCRIPTION: Renders a green line between points (248, 140) and (165, 133).
; PLAN: r0=248(x1), r1=140(y1), r2=165(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 140
LDI r2, 165
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
