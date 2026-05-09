; DESCRIPTION: Renders a yellow line between points (234, 139) and (208, 14).
; PLAN: r0=234(x1), r1=139(y1), r2=208(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 139
LDI r2, 208
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
