; DESCRIPTION: Renders a yellow line between points (86, 208) and (342, 161).
; PLAN: r0=86(x1), r1=208(y1), r2=342(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 208
LDI r2, 342
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
