; DESCRIPTION: Renders a green line between points (484, 139) and (262, 234).
; PLAN: r0=484(x1), r1=139(y1), r2=262(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 139
LDI r2, 262
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
