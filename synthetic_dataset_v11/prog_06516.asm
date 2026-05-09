; DESCRIPTION: Renders a magenta line between points (17, 80) and (208, 139).
; PLAN: r0=17(x1), r1=80(y1), r2=208(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 80
LDI r2, 208
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
