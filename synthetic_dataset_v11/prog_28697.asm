; DESCRIPTION: Renders a yellow line between points (137, 235) and (222, 137).
; PLAN: r0=137(x1), r1=235(y1), r2=222(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 235
LDI r2, 222
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
