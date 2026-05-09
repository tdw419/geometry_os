; DESCRIPTION: Renders a yellow line between points (18, 171) and (345, 216).
; PLAN: r0=18(x1), r1=171(y1), r2=345(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 171
LDI r2, 345
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
