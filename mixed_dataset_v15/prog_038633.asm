; DESCRIPTION: Renders a yellow line between points (108, 47) and (156, 104).
; PLAN: r0=108(x1), r1=47(y1), r2=156(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 47
LDI r2, 156
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
