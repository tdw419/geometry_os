; DESCRIPTION: Renders a green line between points (248, 140) and (234, 121).
; PLAN: r0=248(x1), r1=140(y1), r2=234(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 140
LDI r2, 234
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
