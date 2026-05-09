; DESCRIPTION: Renders a yellow line between points (92, 117) and (65, 116).
; PLAN: r0=92(x1), r1=117(y1), r2=65(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 117
LDI r2, 65
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
