; DESCRIPTION: Renders a yellow line between points (107, 10) and (72, 155).
; PLAN: r0=107(x1), r1=10(y1), r2=72(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 10
LDI r2, 72
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
