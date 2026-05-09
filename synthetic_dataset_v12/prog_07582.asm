; DESCRIPTION: Places a black line segment connecting (131, 180) to (256, 200).
; PLAN: r0=131(x1), r1=180(y1), r2=256(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 180
LDI r2, 256
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
