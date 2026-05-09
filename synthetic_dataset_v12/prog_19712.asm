; DESCRIPTION: Renders a yellow line between points (221, 203) and (226, 234).
; PLAN: r0=221(x1), r1=203(y1), r2=226(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 203
LDI r2, 226
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
