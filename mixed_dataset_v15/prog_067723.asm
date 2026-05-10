; DESCRIPTION: Renders a green line between points (114, 106) and (195, 114).
; PLAN: r0=114(x1), r1=106(y1), r2=195(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 106
LDI r2, 195
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
