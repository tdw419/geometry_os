; DESCRIPTION: Renders a yellow line between points (24, 36) and (389, 161).
; PLAN: r0=24(x1), r1=36(y1), r2=389(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 36
LDI r2, 389
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
