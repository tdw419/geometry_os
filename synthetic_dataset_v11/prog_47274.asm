; DESCRIPTION: Places a yellow line segment connecting (196, 51) to (141, 231).
; PLAN: r0=196(x1), r1=51(y1), r2=141(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 51
LDI r2, 141
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
