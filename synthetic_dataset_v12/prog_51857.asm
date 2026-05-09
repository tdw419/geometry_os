; DESCRIPTION: Renders a yellow line between points (72, 203) and (509, 61).
; PLAN: r0=72(x1), r1=203(y1), r2=509(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 203
LDI r2, 509
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
