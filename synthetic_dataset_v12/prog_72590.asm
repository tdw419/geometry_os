; DESCRIPTION: Places a black line segment connecting (447, 57) to (70, 37).
; PLAN: r0=447(x1), r1=57(y1), r2=70(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 57
LDI r2, 70
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
