; DESCRIPTION: Renders a green line between points (478, 58) and (271, 238).
; PLAN: r0=478(x1), r1=58(y1), r2=271(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 58
LDI r2, 271
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
