; DESCRIPTION: Places a yellow line segment connecting (46, 110) to (440, 51).
; PLAN: r0=46(x1), r1=110(y1), r2=440(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 110
LDI r2, 440
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
