; DESCRIPTION: Renders a yellow line between points (194, 60) and (215, 149).
; PLAN: r0=194(x1), r1=60(y1), r2=215(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 60
LDI r2, 215
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
