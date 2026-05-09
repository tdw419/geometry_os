; DESCRIPTION: Renders a yellow line between points (95, 240) and (72, 3).
; PLAN: r0=95(x1), r1=240(y1), r2=72(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 240
LDI r2, 72
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
