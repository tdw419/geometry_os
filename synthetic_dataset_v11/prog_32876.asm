; DESCRIPTION: Renders a yellow line between points (131, 106) and (215, 58).
; PLAN: r0=131(x1), r1=106(y1), r2=215(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 106
LDI r2, 215
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
