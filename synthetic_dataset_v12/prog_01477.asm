; DESCRIPTION: Renders a yellow line between points (423, 64) and (210, 19).
; PLAN: r0=423(x1), r1=64(y1), r2=210(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 64
LDI r2, 210
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
