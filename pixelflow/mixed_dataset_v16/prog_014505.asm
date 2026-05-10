; DESCRIPTION: Renders a green line between points (431, 189) and (179, 134).
; PLAN: r0=431(x1), r1=189(y1), r2=179(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 189
LDI r2, 179
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
