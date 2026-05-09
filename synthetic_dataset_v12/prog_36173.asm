; DESCRIPTION: Renders a yellow line between points (368, 190) and (72, 72).
; PLAN: r0=368(x1), r1=190(y1), r2=72(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 190
LDI r2, 72
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
