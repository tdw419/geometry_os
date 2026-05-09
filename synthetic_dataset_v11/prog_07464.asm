; DESCRIPTION: Renders a green line between points (225, 12) and (170, 124).
; PLAN: r0=225(x1), r1=12(y1), r2=170(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 12
LDI r2, 170
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
