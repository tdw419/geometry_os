; DESCRIPTION: Renders a yellow line between points (176, 61) and (233, 38).
; PLAN: r0=176(x1), r1=61(y1), r2=233(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 61
LDI r2, 233
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
