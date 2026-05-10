; DESCRIPTION: Renders a yellow line between points (76, 64) and (153, 170).
; PLAN: r0=76(x1), r1=64(y1), r2=153(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 64
LDI r2, 153
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
