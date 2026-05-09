; DESCRIPTION: Places a black line segment connecting (113, 169) to (4, 249).
; PLAN: r0=113(x1), r1=169(y1), r2=4(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 169
LDI r2, 4
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
