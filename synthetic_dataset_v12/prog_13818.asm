; DESCRIPTION: Places a black line segment connecting (440, 33) to (317, 128).
; PLAN: r0=440(x1), r1=33(y1), r2=317(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 33
LDI r2, 317
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
