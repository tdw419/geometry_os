; DESCRIPTION: Renders a yellow line between points (488, 190) and (131, 46).
; PLAN: r0=488(x1), r1=190(y1), r2=131(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 190
LDI r2, 131
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
