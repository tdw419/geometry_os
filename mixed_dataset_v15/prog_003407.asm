; DESCRIPTION: Renders a yellow line between points (182, 203) and (262, 105).
; PLAN: r0=182(x1), r1=203(y1), r2=262(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 203
LDI r2, 262
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
