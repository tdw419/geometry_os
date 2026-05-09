; DESCRIPTION: Places a black line segment connecting (350, 52) to (419, 209).
; PLAN: r0=350(x1), r1=52(y1), r2=419(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 52
LDI r2, 419
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
