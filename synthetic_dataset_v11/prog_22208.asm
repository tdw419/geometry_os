; DESCRIPTION: Renders a green line between points (225, 142) and (71, 62).
; PLAN: r0=225(x1), r1=142(y1), r2=71(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 142
LDI r2, 71
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
