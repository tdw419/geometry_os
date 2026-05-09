; DESCRIPTION: Renders a yellow line between points (80, 56) and (336, 187).
; PLAN: r0=80(x1), r1=56(y1), r2=336(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 56
LDI r2, 336
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
