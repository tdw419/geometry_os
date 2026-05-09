; DESCRIPTION: Renders a green line between points (225, 233) and (427, 237).
; PLAN: r0=225(x1), r1=233(y1), r2=427(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 233
LDI r2, 427
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
