; DESCRIPTION: Places a black line segment connecting (449, 188) to (492, 32).
; PLAN: r0=449(x1), r1=188(y1), r2=492(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 188
LDI r2, 492
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
