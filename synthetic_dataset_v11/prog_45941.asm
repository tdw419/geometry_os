; DESCRIPTION: Places a green line segment connecting (131, 3) to (35, 19).
; PLAN: r0=131(x1), r1=3(y1), r2=35(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 3
LDI r2, 35
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
