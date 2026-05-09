; DESCRIPTION: Renders a yellow line between points (228, 114) and (484, 161).
; PLAN: r0=228(x1), r1=114(y1), r2=484(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 114
LDI r2, 484
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
