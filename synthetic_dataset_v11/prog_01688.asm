; DESCRIPTION: Renders a orange line between points (117, 136) and (213, 169).
; PLAN: r0=117(x1), r1=136(y1), r2=213(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 136
LDI r2, 213
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
