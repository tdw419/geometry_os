; DESCRIPTION: Renders a green line between points (240, 217) and (153, 129).
; PLAN: r0=240(x1), r1=217(y1), r2=153(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 217
LDI r2, 153
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
