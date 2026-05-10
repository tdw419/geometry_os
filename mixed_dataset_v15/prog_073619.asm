; DESCRIPTION: Places a yellow line segment connecting (435, 207) to (392, 51).
; PLAN: r0=435(x1), r1=207(y1), r2=392(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 207
LDI r2, 392
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
