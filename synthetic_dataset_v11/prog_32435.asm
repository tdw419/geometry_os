; DESCRIPTION: Places a yellow line segment connecting (230, 193) to (115, 96).
; PLAN: r0=230(x1), r1=193(y1), r2=115(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 193
LDI r2, 115
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
