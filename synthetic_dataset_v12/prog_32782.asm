; DESCRIPTION: Places a yellow line segment connecting (219, 217) to (345, 164).
; PLAN: r0=219(x1), r1=217(y1), r2=345(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 217
LDI r2, 345
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
