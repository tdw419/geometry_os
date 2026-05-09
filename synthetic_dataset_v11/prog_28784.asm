; DESCRIPTION: Places a red line segment connecting (240, 55) to (147, 191).
; PLAN: r0=240(x1), r1=55(y1), r2=147(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 55
LDI r2, 147
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
