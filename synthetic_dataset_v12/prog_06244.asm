; DESCRIPTION: Places a black line segment connecting (135, 81) to (440, 118).
; PLAN: r0=135(x1), r1=81(y1), r2=440(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 81
LDI r2, 440
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
