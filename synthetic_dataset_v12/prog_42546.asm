; DESCRIPTION: Places a black line segment connecting (480, 178) to (357, 176).
; PLAN: r0=480(x1), r1=178(y1), r2=357(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 178
LDI r2, 357
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
