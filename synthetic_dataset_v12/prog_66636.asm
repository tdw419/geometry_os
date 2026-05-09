; DESCRIPTION: Renders a yellow line between points (460, 83) and (137, 169).
; PLAN: r0=460(x1), r1=83(y1), r2=137(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 83
LDI r2, 137
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
