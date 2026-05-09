; DESCRIPTION: Places a black line segment connecting (279, 169) to (440, 169).
; PLAN: r0=279(x1), r1=169(y1), r2=440(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 169
LDI r2, 440
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
