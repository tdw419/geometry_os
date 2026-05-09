; DESCRIPTION: Renders a yellow line between points (107, 36) and (10, 92).
; PLAN: r0=107(x1), r1=36(y1), r2=10(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 36
LDI r2, 10
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
